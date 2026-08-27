module Localizable
  extend ActiveSupport::Concern

  # "Finnish // English" convention; uses the request locale unless overridden
  def localize(text, english = I18n.locale == :en)
    return text if text.blank? || !text.include?('//')

    fi, en = text.split('//', 2).map(&:strip)
    english ? en.presence || fi : fi
  end
end
