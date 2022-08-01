class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_contact_email(@contact).deliver_now
      redirect_to contacts_done_path
    else
      flash.now[:danger] = '問い合わせが送信できませんでした。'
      render 'contacts/new'
    end
  end

  #問い合わせが完了した際に完了画面を表示する
  def done
  end

  def contact_params
    params.require(:contact).permit(:email, :subject, :message)
  end

end
