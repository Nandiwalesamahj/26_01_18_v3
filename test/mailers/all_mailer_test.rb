require 'test_helper'

class AllMailerTest < ActionMailer::TestCase
  test "feedbacks_new" do
    mail = AllMailer.feedbacks_new
    assert_equal "Feedbacks new", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "help_new" do
    mail = AllMailer.help_new
    assert_equal "Help new", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "user_new" do
    mail = AllMailer.user_new
    assert_equal "User new", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "vadhuvar_new" do
    mail = AllMailer.vadhuvar_new
    assert_equal "Vadhuvar new", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "tanta_new" do
    mail = AllMailer.tanta_new
    assert_equal "Tanta new", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "recruitments_new" do
    mail = AllMailer.recruitments_new
    assert_equal "Recruitments new", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "mahatvache_vyakti_new" do
    mail = AllMailer.mahatvache_vyakti_new
    assert_equal "Mahatvache vyakti new", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
