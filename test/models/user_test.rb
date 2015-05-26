require 'test_helper'

class UserTest < ActiveSupport::TestCase
	 # Teste unitario de validação
	test 'name must by required' do
		user = User.create(name: nil)
		assert user.errors[:name].any?
	end

	test 'email must by required' do
		user = User.create(email: nil)
		assert user.errors[:email].any?

		%w[
			a@a
			a@a.a
		].each do |email|
			user = User.create(email: email)
			assert user.errors[:email].any?, "#{email} must by invalid"
		end
	end
	test 'email must accepted' do
		%w[
			jhon@example.com
			jhon@example.co.uk
			jhon@example.com.br
			jhon@example.info
			jhon@example.io
			jhon.doe@example.com
			jhon_doe@example.com
			jhon@sub.example.com
			jhon@sub-example.com
			jhon@sub.example.com
			jhon.doe+spam@example.com
			JHON.DOE@EXAMPLE.COMS

		].each do |email|
			user = User.create(email: email)
			assert user.errors[:email].empty?, "#{email} must by accepted"
		end
	end
		# Teste(garantindo) de unicidade de email
	test 'email must be unique' do
		# Helper da gem factory-girl
		user = create(:user)
		# possibilidades Exemplo de uso, instanciando
		# user = build(:user)

		outro_usuario = User.create(email: user.email)
		assert outro_usuario.errors[:email].any?
	end
end
