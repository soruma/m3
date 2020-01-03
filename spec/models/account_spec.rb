# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account do
  it_behaves_like 'to_csv'

  describe 'FileImport' do
    before do
      [101, 102].each { |use_id| create(:use, id: use_id) }
    end

    let(:import_file) do
      fixture_file_upload('spec/fixtures/csv/account.csv', 'text/comma-separated-values')
    end
    let(:file_import_new_value) { build(:account, id: 101, name: 'カンザス銀行', use_id: 101) }
    let(:file_import_old_value) { build(:account, id: 101, name: 'アラスカ銀行', use_id: 101) }

    it_behaves_like 'file_import'
  end

  describe 'Validation' do
    it 'is valid with name and use' do
      account = build(:account)
      expect(account).to be_valid
    end

    it 'is invalid with name' do
      history = build(:account, name: nil)
      history.valid?
      expect(history.errors[:name]).to include(%(can't be blank))
    end

    it 'is invalid with use' do
      history = build(:account, use: nil)
      history.valid?
      expect(history.errors[:use]).to include('must exist')
    end
  end

  describe 'Scope' do
    describe '#referential' do
      before do
        use = create(:use)
        create_list(:account, 2, use: use)
      end

      it 'eager loading of uses table' do
        targets = described_class.referential
        expect(targets.first.association(:use).loaded?).to be_truthy
      end
    end
  end
end
