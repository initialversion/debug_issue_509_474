class GroupsController < ApplicationController
  def index
    @q = Group.ransack(params[:q])
    @groups = @q.result(:distinct => true).includes(:group_members, :users).page(params[:page]).per(10)

    render("groups/index.html.erb")
  end

  def show
    @group_member = GroupMember.new
    @group = Group.find(params[:id])

    render("groups/show.html.erb")
  end

  def new
    @group = Group.new

    render("groups/new.html.erb")
  end

  def create
    @group = Group.new

    @group.name = params[:name]
    @group.school = params[:school]
    @group.industry = params[:industry]
    @group.open_or_closed = params[:open_or_closed]
    @group.hidden_or_public = params[:hidden_or_public]
    @group.password = params[:password]

    save_status = @group.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/groups/new", "/create_group"
        redirect_to("/groups")
      else
        redirect_back(:fallback_location => "/", :notice => "Group created successfully.")
      end
    else
      render("groups/new.html.erb")
    end
  end

  def edit
    @group = Group.find(params[:id])

    render("groups/edit.html.erb")
  end

  def update
    @group = Group.find(params[:id])

    @group.name = params[:name]
    @group.school = params[:school]
    @group.industry = params[:industry]
    @group.open_or_closed = params[:open_or_closed]
    @group.hidden_or_public = params[:hidden_or_public]
    @group.password = params[:password]

    save_status = @group.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/groups/#{@group.id}/edit", "/update_group"
        redirect_to("/groups/#{@group.id}", :notice => "Group updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Group updated successfully.")
      end
    else
      render("groups/edit.html.erb")
    end
  end

  def destroy
    @group = Group.find(params[:id])

    @group.destroy

    if URI(request.referer).path == "/groups/#{@group.id}"
      redirect_to("/", :notice => "Group deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Group deleted.")
    end
  end
end
