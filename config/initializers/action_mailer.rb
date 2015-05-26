Rails.env.on(:development) do |config|
  config.action_mailer.default_url_options = {
    host: 'localhost',
    port: 3000
  }
end

Rails.env.on(:test, :production) do |config|
  config.action_mailer.default_url_options = {
    host: 'taskv.com.br'
  }
end

Rails.env.on(:production) do |config|
  config.action_mailer.smtp_settings = {}
  config.action_mailer.deliver_method = :smtp # :sendmail :teste_sendmail :file....
end
