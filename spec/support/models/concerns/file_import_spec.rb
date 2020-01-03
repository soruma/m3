# frozen_string_literal: true

require 'rails_helper'

module FileImport
  shared_examples_for 'file_import' do
    describe '.csv_file_import' do
      subject { described_class.csv_file_import(import_file) }

      let(:import_data_count) { File.read(import_file).force_encoding('Shift_JIS').count("\n") - 1 }

      it 'first line is not included in data' do
        expect { subject }.to change { described_class.count }.by(import_data_count)
      end

      context 'when id is not already registered' do
        it 'all records are newly create' do
          expect { subject }.to change { described_class.count }.from(0).to(import_data_count)
        end
      end

      context 'when id is already registered' do
        before { file_import_old_value.save }

        it 'some records are newly create' do
          expect { subject }.to change { described_class.count }.from(1).to(import_data_count)
        end

        it 'attribute value linked to id is update' do
          attributes = described_class.updatable_attributes.map(&:to_sym)
          subject
          expect(described_class.all.pluck(*attributes)).not_to(
            include(file_import_old_value.attributes.slice(*attributes).values)
          )
          expect(described_class.all.pluck(*attributes)).to(
            include(file_import_new_value.slice(*attributes).values)
          )
        end
      end
    end
  end
end
