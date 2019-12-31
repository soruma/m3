# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileImportHelper do
  describe '#csv_file_import' do
    subject { Use.csv_file_import(import_file) }

    let(:import_file) do
      fixture_file_upload('spec/fixtures/csv/use.csv', 'text/comma-separated-values')
    end

    it 'first line is not included in data' do
      expect { subject }.to change { Use.count }.by(2)
    end

    it 'files with file encoding shift-jis are not garbled' do
      expect { subject }.to change { Use.where(name: '普段使い').count }.from(0).to(1)
    end

    context 'when id is not already registered' do
      it 'all records are newly create' do
        expect { subject }.to change { Use.count }.from(0).to(2)
      end
    end

    context 'when id is already registered' do
      before do
        create(:use, id: 101, name: 'いつも使う')
      end

      it 'some records are newly create' do
        expect { subject }.to change { Use.count }.from(1).to(2)
      end

      it 'attribute value linked to id is update' do
        expect { subject }.to change { Use.where(name: '普段使い').count }.from(0).to(1)
      end
    end
  end
end
