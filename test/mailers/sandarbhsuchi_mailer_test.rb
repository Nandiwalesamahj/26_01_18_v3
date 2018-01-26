require 'test_helper'

class SandarbhsuchiMailerTest < ActionMailer::TestCase
  test "new_created" do
    mail = SandarbhsuchiMailer.new_created
    assert_equal "New created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
