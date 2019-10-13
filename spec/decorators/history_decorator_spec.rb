# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HistoryDecorator do
  let(:history) do
    ActiveDecorator::Decorator.instance.decorate(
      create(:history, date_of_onset: '2019-12-25')
    )
  end

  it 'return year and month' do
    expect(history.onset_month).to eq '2019/12'
  end
end
