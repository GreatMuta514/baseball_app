class ContactMailer < ApplicationMailer

  def send_contact_email(contact)
    @contact = contact
    mail to: ENV['TOMAIL'], subject: 'お問い合わせ'
  end

end
