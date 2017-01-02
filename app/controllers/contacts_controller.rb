class ContactsController < ApplicationController
  def index
    @contacts = Contact.page(params[:page]).per(10)

    render("contacts/index.html.erb")
  end

  def show
    @touchpoint = Touchpoint.new
    @contact = Contact.find(params[:id])

    render("contacts/show.html.erb")
  end

  def new
    @contact = Contact.new

    render("contacts/new.html.erb")
  end

  def create
    @contact = Contact.new

    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.firm_id = params[:firm_id]
    @contact.group = params[:group]
    @contact.division = params[:division]
    @contact.title = params[:title]
    @contact.photo = params[:photo]
    @contact.business_card = params[:business_card]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]

    save_status = @contact.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/contacts/new", "/create_contact"
        redirect_to("/contacts")
      else
        redirect_back(:fallback_location => "/", :notice => "Contact created successfully.")
      end
    else
      render("contacts/new.html.erb")
    end
  end

  def edit
    @contact = Contact.find(params[:id])

    render("contacts/edit.html.erb")
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.firm_id = params[:firm_id]
    @contact.group = params[:group]
    @contact.division = params[:division]
    @contact.title = params[:title]
    @contact.photo = params[:photo]
    @contact.business_card = params[:business_card]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]

    save_status = @contact.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/contacts/#{@contact.id}/edit", "/update_contact"
        redirect_to("/contacts/#{@contact.id}", :notice => "Contact updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Contact updated successfully.")
      end
    else
      render("contacts/edit.html.erb")
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    @contact.destroy

    if URI(request.referer).path == "/contacts/#{@contact.id}"
      redirect_to("/", :notice => "Contact deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Contact deleted.")
    end
  end
end
