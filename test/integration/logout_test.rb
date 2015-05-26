require 'test_helper'

class LogoutTest < ActionDispatch::IntegrationTest
  test 'terminate session from logged users' do
    user = create(:user)
    login_as(user)

    visit tasks_path
    click_on t('menu.logout')

    assert_equal login_path, current_path
    assert page.has_text?(notice('login.destroy'))

    visit tasks_path

    assert_equal login_path, current_path
    assert page.has_text?(t('flash.must_be_logged_in'))
  end
end
