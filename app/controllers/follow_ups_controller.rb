class FollowUpsController < ApplicationController
  def index
    @q = FollowUp.ransack(params[:q])
    @follow_ups = @q.result(:distinct => true).includes(:user, :firm).page(params[:page]).per(10)

    render("follow_ups/index.html.erb")
  end

  def show
    @follow_up = FollowUp.find(params[:id])

    render("follow_ups/show.html.erb")
  end

  def new
    @follow_up = FollowUp.new

    render("follow_ups/new.html.erb")
  end

  def create
    @follow_up = FollowUp.new

    @follow_up.follow_up_type = params[:follow_up_type]
    @follow_up.touchpoint_id = params[:touchpoint_id]
    @follow_up.user_id = params[:user_id]
    @follow_up.firm_id = params[:firm_id]
    @follow_up.contact_id = params[:contact_id]
    @follow_up.notes = params[:notes]

    save_status = @follow_up.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/follow_ups/new", "/create_follow_up"
        redirect_to("/follow_ups")
      else
        redirect_back(:fallback_location => "/", :notice => "Follow up created successfully.")
      end
    else
      render("follow_ups/new.html.erb")
    end
  end

  def edit
    @follow_up = FollowUp.find(params[:id])

    render("follow_ups/edit.html.erb")
  end

  def update
    @follow_up = FollowUp.find(params[:id])

    @follow_up.follow_up_type = params[:follow_up_type]
    @follow_up.touchpoint_id = params[:touchpoint_id]
    @follow_up.user_id = params[:user_id]
    @follow_up.firm_id = params[:firm_id]
    @follow_up.contact_id = params[:contact_id]
    @follow_up.notes = params[:notes]

    save_status = @follow_up.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/follow_ups/#{@follow_up.id}/edit", "/update_follow_up"
        redirect_to("/follow_ups/#{@follow_up.id}", :notice => "Follow up updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Follow up updated successfully.")
      end
    else
      render("follow_ups/edit.html.erb")
    end
  end

  def destroy
    @follow_up = FollowUp.find(params[:id])

    @follow_up.destroy

    if URI(request.referer).path == "/follow_ups/#{@follow_up.id}"
      redirect_to("/", :notice => "Follow up deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Follow up deleted.")
    end
  end
end
