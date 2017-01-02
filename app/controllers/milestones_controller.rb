class MilestonesController < ApplicationController
  def index
    @milestones = Milestone.page(params[:page]).per(10)

    render("milestones/index.html.erb")
  end

  def show
    @milestone = Milestone.find(params[:id])

    render("milestones/show.html.erb")
  end

  def new
    @milestone = Milestone.new

    render("milestones/new.html.erb")
  end

  def create
    @milestone = Milestone.new

    @milestone.campus_recruiting_start = params[:campus_recruiting_start]
    @milestone.closed_events_start = params[:closed_events_start]
    @milestone.bankweek = params[:bankweek]
    @milestone.interviews_start = params[:interviews_start]

    save_status = @milestone.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/milestones/new", "/create_milestone"
        redirect_to("/milestones")
      else
        redirect_back(:fallback_location => "/", :notice => "Milestone created successfully.")
      end
    else
      render("milestones/new.html.erb")
    end
  end

  def edit
    @milestone = Milestone.find(params[:id])

    render("milestones/edit.html.erb")
  end

  def update
    @milestone = Milestone.find(params[:id])

    @milestone.campus_recruiting_start = params[:campus_recruiting_start]
    @milestone.closed_events_start = params[:closed_events_start]
    @milestone.bankweek = params[:bankweek]
    @milestone.interviews_start = params[:interviews_start]

    save_status = @milestone.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/milestones/#{@milestone.id}/edit", "/update_milestone"
        redirect_to("/milestones/#{@milestone.id}", :notice => "Milestone updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Milestone updated successfully.")
      end
    else
      render("milestones/edit.html.erb")
    end
  end

  def destroy
    @milestone = Milestone.find(params[:id])

    @milestone.destroy

    if URI(request.referer).path == "/milestones/#{@milestone.id}"
      redirect_to("/", :notice => "Milestone deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Milestone deleted.")
    end
  end
end
