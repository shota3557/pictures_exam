class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: @contact.user.email, subject: '問い合わせ確認のメール'
  end
end
