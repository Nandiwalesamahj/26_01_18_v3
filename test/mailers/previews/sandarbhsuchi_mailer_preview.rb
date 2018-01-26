# Preview all emails at http://localhost:3000/rails/mailers/sandarbhsuchi_mailer
class SandarbhsuchiMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sandarbhsuchi_mailer/new_created
  def new_created
    SandarbhsuchiMailer.new_created
  end

end
