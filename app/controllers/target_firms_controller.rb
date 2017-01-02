class TargetFirmsController < ApplicationController
  def index
    @q = TargetFirm.ransack(params[:q])
    @target_firms = @q.result(:distinct => true).includes(:user, :firm).page(params[:page]).per(10)

    render("target_firms/index.html.erb")
  end

  def show
    @target_firm = TargetFirm.find(params[:id])

    render("target_firms/show.html.erb")
  end

  def new
    @target_firm = TargetFirm.new

    render("target_firms/new.html.erb")
  end

  def create
    @target_firm = TargetFirm.new

    @target_firm.user_id = params[:user_id]
    @target_firm.firm_id = params[:firm_id]
    @target_firm.touch_goal = params[:touch_goal]

    save_status = @target_firm.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/target_firms/new", "/create_target_firm"
        redirect_to("/target_firms")
      else
        redirect_back(:fallback_location => "/", :notice => "Target firm created successfully.")
      end
    else
      render("target_firms/new.html.erb")
    end
  end

  def edit
    @target_firm = TargetFirm.find(params[:id])

    render("target_firms/edit.html.erb")
  end

  def update
    @target_firm = TargetFirm.find(params[:id])

    @target_firm.user_id = params[:user_id]
    @target_firm.firm_id = params[:firm_id]
    @target_firm.touch_goal = params[:touch_goal]

    save_status = @target_firm.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/target_firms/#{@target_firm.id}/edit", "/update_target_firm"
        redirect_to("/target_firms/#{@target_firm.id}", :notice => "Target firm updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Target firm updated successfully.")
      end
    else
      render("target_firms/edit.html.erb")
    end
  end

  def destroy
    @target_firm = TargetFirm.find(params[:id])

    @target_firm.destroy

    if URI(request.referer).path == "/target_firms/#{@target_firm.id}"
      redirect_to("/", :notice => "Target firm deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Target firm deleted.")
    end
  end
end
