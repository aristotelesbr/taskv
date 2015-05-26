module Locale
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end
  private

  def default_url_options(options = {})
    options.merge(locale: I18n.locale)
  end

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale)
  end
end
