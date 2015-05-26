ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'capybara/rails'
# Carregas os registros  do diretorio test/support/factories
require_relative 'support/factories'

class ActiveSupport::TestCase
  #Cria helpers para escrita dos testes  *ver Integration/Login_test
  include FactoryGirl::Syntax::Methods
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  def t(*args)
    I18n.t(*args)
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL


  def label(scope)
    t(scope, scope: 'labels')
  end

  def button(scope)
    t(scope, scope: 'helpers.submit')
  end

  def notice(scope)
    t("flash.#{scope}.notice")
  end

  def alert(scope)
    t("flash.#{scope}.alert")
  end

  def form_error_message
    t("form_error_message")
  end

  def login_as(user, password = 'test')
    visit root_path
    click_link t('menu.login')

    fill_in label('user.email'),with: user.email
    fill_in label('user.password'),with: password
    click_button button ('login')
  end

  teardown do
  	Capybara.reset_sessions!
  end
end

class ActionMailer::TestCase
  include Rails.application.routes.url_helpers

  def default_url_options(options = {})
    options.merge(ActionMailer::Base.default_url_options)
  end
end
