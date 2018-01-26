class SandarbhsuchiMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sandarbhsuchi_mailer.new_created.subject
  #
  def new_created
 

    mail to: "shramikgajlekar@gmail.com",
    	subject: "New Sandarbhsuchi_created" 
  end
end
