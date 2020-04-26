# frozen_string_literal: true

module ImportFile
  extend ActiveSupport::Concern

  def import
    case params[:controller]
    when 'uses' then uses_import
    when 'accounts' then accounts_import
    when 'histories' then histories_import
    end
  end

  def uses_import
    _import Use
  end

  def accounts_import
    _import Account
  end

  def histories_import
    _import History
  end

  private

  def _import(model) # rubocop:disable Metrics/MethodLength
    message = begin
                model.csv_file_import(params[:file])
                { notice: t('controller.success_import', model: model.model_name.human) }
              rescue ActiveRecord::RecordInvalid
                { alert: t('controller.unsuccess_import_record_invalid', model: model.model_name.human) }
              rescue NoMethodError
                { alert: t('controller.unsuccess_import_no_choose', model: model.model_name.human) }
              end
    respond_to do |format|
      format.html { redirect_to ({ action: :index }), message }
      format.json { head :no_content }
    end
  end
end
