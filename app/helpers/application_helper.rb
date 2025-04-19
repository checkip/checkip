module ApplicationHelper
  def rougify(text, language)
    formatter = Rouge::Formatters::HTML.new
    lexer = Rouge::Lexer.find(language)
    formatter.format(lexer.lex(text))
  end

  def app_name_footer
    if ENV['CHECKIP_SHOW_VERSION'] == 'true'
      t('pages.application.core.app') + " v#{Checkip::Application::VERSION}"
    else
      t('pages.application.core.app')
    end
  end
end
