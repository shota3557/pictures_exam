class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to contacts_path, notice: '問い合わせは完了しました'
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
