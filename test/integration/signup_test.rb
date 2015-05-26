 require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
		# Essa descrição é opcional
	test 'when providing valid data' do
		# Visite a pagina inicial
		visit root_path
		# Clique no botão Cadastre-se
		click_on  t ('menu.signup')
		# (fill_in) ->Preencha o campo - com -
		fill_in label('user.name'), with: 'John Doe'
		fill_in label('user.email'), with: 'johndoe@example.org'
		fill_in label('user.password'), with: 'test'
		fill_in label('user.password_confirmation'), with: 'test'
		click_on button('user.create')

		# Depois de passadas as ações eu...
		# Espero que(assert_equal)....A pagiana atual seja a que eu etou passando
		assert_equal login_path, current_path
		# E que a minha pgina tenha o texto...
		assert page.has_text?(notice('signup.create'))
	end
	# Teste para erro
	test 'when providing invalid data' do
		visit root_path
		click_on  t ('menu.signup')
		click_on button ('user.create')

		assert_equal signup_path, current_path
		assert page.has_text?(form_error_message)
	end
end
