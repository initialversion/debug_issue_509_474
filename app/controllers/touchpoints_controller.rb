class TouchpointsController < ApplicationController
  def index
    @touchpoints = Touchpoint.page(params[:page]).per(10)

    render("touchpoints/index.html.erb")
  end

  def show
    @touchpoint = Touchpoint.find(params[:id])

    render("touchpoints/show.html.erb")
  end

  def new
    @touchpoint = Touchpoint.new

    render("touchpoints/new.html.erb")
  end

  def create
    @touchpoint = Touchpoint.new

    @touchpoint.date = params[:date]
    @touchpoint.time = params[:time]
    @touchpoint.user_id = params[:user_id]
    @touchpoint.contact_id = params[:contact_id]
    @touchpoint.firm_id = params[:firm_id]
    @touchpoint.description = params[:description]
    @touchpoint.location = params[:location]
    @touchpoint.notes = params[:notes]

    save_status = @touchpoint.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/touchpoints/new", "/create_touchpoint"
        redirect_to("/touchpoints")
      else
        redirect_back(:fallback_location => "/", :notice => "Touchpoint created successfully.")
      end
    else
      render("touchpoints/new.html.erb")
    end
  end

  def edit
    @touchpoint = Touchpoint.find(params[:id])

    render("touchpoints/edit.html.erb")
  end

  def update
    @touchpoint = Touchpoint.find(params[:id])

    @touchpoint.date = params[:date]
    @touchpoint.time = params[:time]
    @touchpoint.user_id = params[:user_id]
    @touchpoint.contact_id = params[:contact_id]
    @touchpoint.firm_id = params[:firm_id]
    @touchpoint.description = params[:description]
    @touchpoint.location = params[:location]
    @touchpoint.notes = params[:notes]

    save_status = @touchpoint.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/touchpoints/#{@touchpoint.id}/edit", "/update_touchpoint"
        redirect_to("/touchpoints/#{@touchpoint.id}", :notice => "Touchpoint updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Touchpoint updated successfully.")
      end
    else
      render("touchpoints/edit.html.erb")
    end
  end

  def destroy
    @touchpoint = Touchpoint.find(params[:id])

    @touchpoint.destroy

    if URI(request.referer).path == "/touchpoints/#{@touchpoint.id}"
      redirect_to("/", :notice => "Touchpoint deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Touchpoint deleted.")
    end
  end
end
