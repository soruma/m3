# frozen_string_literal: true

module RenderError
  extend ActiveSupport::Concern

  included do
    def render_404
      respond_to do |format|
        format.html { render file: Rails.root.join('public', '404'), layout: false, status: :not_found }
      end
    end
  end
end
