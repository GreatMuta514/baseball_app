class ContactMailer < ApplicationMailer

  def send_contact_email(contact)
    @contact = contact
    mail to: ENV['GMAIL_ADDRESS'], subject: 'お問い合わせ'
  end

end
