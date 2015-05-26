require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "welcome" do
    mail = Mailer.welcome('John Doe', 'johndoe@example.org')
    # require "pry"; binding.pry
    assert_equal t('mailer.welcome.subject'), mail.subject
    assert_equal ['johndoe@example.org'], mail.to
    assert_equal [MAILER_FROM], mail.from
    assert_match 'John Doe', mail.body.encoded
    assert_match login_url, mail.body.encoded
  end

end
