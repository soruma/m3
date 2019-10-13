# frozen_string_literal: true

module ToCsvHelper
  shared_examples_for 'to_csv' do
    let(:object_name) { described_class.to_s.underscore.to_sym }
    let!(:model) { create(object_name) }

    describe '.to_csv' do
      subject { described_class.to_csv(described_class.all) }

      it 'header is included in the first line' do
        csv = CSV.parse(described_class.to_csv(described_class.all))
        expect(csv.first).to eq described_class.updatable_attributes
      end

      it 'data is included in the second and subsequent lines' do
        csv = CSV.parse(described_class.to_csv(described_class.all))
        expect(csv.second.length).to eq described_class.updatable_attributes.length
      end

      context 'when option is set' do
        it 'lines are separated by the character specified by option' do
          csv_str = described_class.to_csv(described_class.all, row_sep: 'sep')
          expect(csv_str).to include 'sep'
        end
      end

      context 'when option is not set' do
        it 'carriage return is set as the line delimiter' do
          csv_str = described_class.to_csv(described_class.all)
          expect(csv_str).to include "\r\n"
        end
      end
    end
  end
end
