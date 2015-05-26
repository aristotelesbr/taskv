require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
      # Validadndo as credenciais de Login
  test 'with valid credentials' do
        # Usando o fixtures para criar usuarios.
        # (users -> nome do arquivo) user(:john) é a referencia do usuario.
        #user = users(:john) Mudei isso para usar a gem 'factory-girl'
        #sintax depois de incluir FactoryGirl::Syntax::Methods no /test_helper.rb
    user = create(:user)

    visit root_path
    click_link t('menu.login')
    # preencha o campo---- com---
    fill_in label('user.email'), with: user.email
    fill_in label('user.password'), with: 'test'
    click_button button('login')
      # click_button especifica que ele deve clicar no botão e não no link com mesmo nome

    assert_equal tasks_path, current_path
    assert page.has_text?(t("user.greeting", name: user.name))
  end

  test 'with invalid credentials' do
    visit root_path
    click_link t('menu.login')
    click_button button('login')

    assert_equal login_path, current_path
    assert page.has_text?(alert('login.create'))
  end
end

