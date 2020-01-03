# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Use do
  it_behaves_like 'to_csv'

  describe 'FileImport' do
    let(:import_file) do
      fixture_file_upload('spec/fixtures/csv/use.csv', 'text/comma-separated-values')
    end
    let(:file_import_new_value) { build(:use, id: 101, name: '普段使い') }
    let(:file_import_old_value) { build(:use, id: 101, name: 'いつも使う') }

    it_behaves_like 'file_import'
  end

  describe 'Validation' do
    it 'is valid with name' do
      use = build(:use)
      expect(use).to be_valid
    end

    it 'is invalid with name' do
      use = build(:use, name: nil)
      use.valid?
      expect(use.errors[:name]).to include(%(can't be blank))
    end
  end

  describe 'Scopes' do
    describe '#referential' do
      before do
        create_list(:use, 2)
      end

      it 'eager loading of accounts table' do
        targets = described_class.referential
        expect(targets.first.association(:accounts).loaded?).to be_truthy
      end
    end
  end
end
