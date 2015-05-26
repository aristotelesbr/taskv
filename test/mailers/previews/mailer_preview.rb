# Preview all emails at http://localhost:3000/rails/mailers/mailer
class MailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mailer/welcome
  def welcome
    Mailer.welcome('John Doe', 'john@example.org')
  end

end
