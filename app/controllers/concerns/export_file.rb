# frozen_string_literal: true

module ExportFile
  extend ActiveSupport::Concern

  included do # rubocop:disable Metrics/BlockLength
    def export
      case params[:controller]
      when 'uses' then uses_export
      when 'accounts' then accounts_export
      when 'histories' then histories_export
      end
    end

    def uses_export
      _export Use
    end

    def accounts_export
      _export Account
    end

    def histories_export
      _export History
    end

    private

    def _export(model)
      respond_to do |format|
        format.html { redirect_to action: :export, format: :csv }
        format.csv do
          render_csv model.to_csv(model.all),
                     file_name: model.model_name.human,
                     charset: 'cp932'
        end
      end
    end
  end
end
