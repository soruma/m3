# frozen_string_literal: true

class SummaryController < ApplicationController
  def index; end

  def chartdata
    @accounts = Account.all
    @histories = History.all
  end
end
