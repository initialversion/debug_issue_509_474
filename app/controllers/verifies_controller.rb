class VerifiesController < ApplicationController
  def index
    @verifies = Verify.page(params[:page]).per(10)

    render("verifies/index.html.erb")
  end

  def show
    @verify = Verify.find(params[:id])

    render("verifies/show.html.erb")
  end

  def new
    @verify = Verify.new

    render("verifies/new.html.erb")
  end

  def create
    @verify = Verify.new

    @verify.user_id = params[:user_id]
    @verify.recruiting_event_id = params[:recruiting_event_id]

    save_status = @verify.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/verifies/new", "/create_verify"
        redirect_to("/verifies")
      else
        redirect_back(:fallback_location => "/", :notice => "Verify created successfully.")
      end
    else
      render("verifies/new.html.erb")
    end
  end

  def edit
    @verify = Verify.find(params[:id])

    render("verifies/edit.html.erb")
  end

  def update
    @verify = Verify.find(params[:id])

    @verify.user_id = params[:user_id]
    @verify.recruiting_event_id = params[:recruiting_event_id]

    save_status = @verify.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/verifies/#{@verify.id}/edit", "/update_verify"
        redirect_to("/verifies/#{@verify.id}", :notice => "Verify updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Verify updated successfully.")
      end
    else
      render("verifies/edit.html.erb")
    end
  end

  def destroy
    @verify = Verify.find(params[:id])

    @verify.destroy

    if URI(request.referer).path == "/verifies/#{@verify.id}"
      redirect_to("/", :notice => "Verify deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Verify deleted.")
    end
  end
end
