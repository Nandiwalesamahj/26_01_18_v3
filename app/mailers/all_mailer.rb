class AllMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.all_mailer.feedbacks_new.subject
  #
  def feedbacks_new(feedback)
    @feedback = feedback

    mail to: "nandisuper2@gmail.com",
          subject: "New pratikriya created !"

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.all_mailer.help_new.subject
  #
  def help_new(help)
    @help = help

    mail to: "nandisuper2@gmail.com",
          subject: "Help Requested!!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.all_mailer.user_new.subject
  #
  def user_new(user)
    @user = user

    mail to: "nandisuper2@gmail.com" ,
          subject: "New User Created!!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.all_mailer.vadhuvar_new.subject
  #
  def vadhuvar_new(vadhuvar)
    @vadhuvar = vadhuvar

    mail to: "nandisuper2@gmail.com",
          subject: "New vadhu/var created!!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.all_mailer.tanta_new.subject
  #
  def tanta_new(tanta)
    @tanta = tanta

    mail to: "nandisuper2@gmail.com",
          subject: "Request To Join TantaMukti Samiti"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.all_mailer.recruitments_new.subject
  #
  def recruitments_new(recruitment)
    @recruitment = recruitment

    mail to: "nandisuper2@gmail.com",
          subject: "New recruitment Requested"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.all_mailer.mahatvache_vyakti_new.subject
  #
  def mahatvache_vyakti_new(mahatvachevyakti)
    @mahatvachevyakti = mahatvachevyakti

    mail to: "nandisuper2@gmail.com",
          subject: "New mahatvachevyakti added"
  end
end
