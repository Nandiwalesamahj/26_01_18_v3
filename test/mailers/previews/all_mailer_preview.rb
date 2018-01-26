# Preview all emails at http://localhost:3000/rails/mailers/all_mailer
class AllMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/all_mailer/feedbacks_new
  def feedbacks_new
    AllMailer.feedbacks_new
  end

  # Preview this email at http://localhost:3000/rails/mailers/all_mailer/help_new
  def help_new
    AllMailer.help_new
  end

  # Preview this email at http://localhost:3000/rails/mailers/all_mailer/user_new
  def user_new
    AllMailer.user_new
  end

  # Preview this email at http://localhost:3000/rails/mailers/all_mailer/vadhuvar_new
  def vadhuvar_new
    AllMailer.vadhuvar_new
  end

  # Preview this email at http://localhost:3000/rails/mailers/all_mailer/tanta_new
  def tanta_new
    AllMailer.tanta_new
  end

  # Preview this email at http://localhost:3000/rails/mailers/all_mailer/recruitments_new
  def recruitments_new
    AllMailer.recruitments_new
  end

  # Preview this email at http://localhost:3000/rails/mailers/all_mailer/mahatvache_vyakti_new
  def mahatvache_vyakti_new
    AllMailer.mahatvache_vyakti_new
  end

end
