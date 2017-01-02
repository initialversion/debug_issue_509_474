class RecruitingEventsController < ApplicationController
  def index
    @recruiting_events = RecruitingEvent.all

    render("recruiting_events/index.html.erb")
  end

  def show
    @recruiting_event = RecruitingEvent.find(params[:id])

    render("recruiting_events/show.html.erb")
  end

  def new
    @recruiting_event = RecruitingEvent.new

    render("recruiting_events/new.html.erb")
  end

  def create
    @recruiting_event = RecruitingEvent.new

    @recruiting_event.name = params[:name]
    @recruiting_event.location = params[:location]
    @recruiting_event.address = params[:address]
    @recruiting_event.date = params[:date]
    @recruiting_event.start_time = params[:start_time]
    @recruiting_event.end_time = params[:end_time]
    @recruiting_event.closed = params[:closed]
    @recruiting_event.firm_id = params[:firm_id]

    save_status = @recruiting_event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/recruiting_events/new", "/create_recruiting_event"
        redirect_to("/recruiting_events")
      else
        redirect_back(:fallback_location => "/", :notice => "Recruiting event created successfully.")
      end
    else
      render("recruiting_events/new.html.erb")
    end
  end

  def edit
    @recruiting_event = RecruitingEvent.find(params[:id])

    render("recruiting_events/edit.html.erb")
  end

  def update
    @recruiting_event = RecruitingEvent.find(params[:id])

    @recruiting_event.name = params[:name]
    @recruiting_event.location = params[:location]
    @recruiting_event.address = params[:address]
    @recruiting_event.date = params[:date]
    @recruiting_event.start_time = params[:start_time]
    @recruiting_event.end_time = params[:end_time]
    @recruiting_event.closed = params[:closed]
    @recruiting_event.firm_id = params[:firm_id]

    save_status = @recruiting_event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/recruiting_events/#{@recruiting_event.id}/edit", "/update_recruiting_event"
        redirect_to("/recruiting_events/#{@recruiting_event.id}", :notice => "Recruiting event updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Recruiting event updated successfully.")
      end
    else
      render("recruiting_events/edit.html.erb")
    end
  end

  def destroy
    @recruiting_event = RecruitingEvent.find(params[:id])

    @recruiting_event.destroy

    if URI(request.referer).path == "/recruiting_events/#{@recruiting_event.id}"
      redirect_to("/", :notice => "Recruiting event deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Recruiting event deleted.")
    end
  end
end
