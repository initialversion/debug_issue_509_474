class GroupMembersController < ApplicationController
  def index
    @group_members = GroupMember.all

    render("group_members/index.html.erb")
  end

  def show
    @group_member = GroupMember.find(params[:id])

    render("group_members/show.html.erb")
  end

  def new
    @group_member = GroupMember.new

    render("group_members/new.html.erb")
  end

  def create
    @group_member = GroupMember.new

    @group_member.group_id = params[:group_id]
    @group_member.user_id = params[:user_id]
    @group_member.is_admin = params[:is_admin]

    save_status = @group_member.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/group_members/new", "/create_group_member"
        redirect_to("/group_members")
      else
        redirect_back(:fallback_location => "/", :notice => "Group member created successfully.")
      end
    else
      render("group_members/new.html.erb")
    end
  end

  def edit
    @group_member = GroupMember.find(params[:id])

    render("group_members/edit.html.erb")
  end

  def update
    @group_member = GroupMember.find(params[:id])

    @group_member.group_id = params[:group_id]
    @group_member.user_id = params[:user_id]
    @group_member.is_admin = params[:is_admin]

    save_status = @group_member.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/group_members/#{@group_member.id}/edit", "/update_group_member"
        redirect_to("/group_members/#{@group_member.id}", :notice => "Group member updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Group member updated successfully.")
      end
    else
      render("group_members/edit.html.erb")
    end
  end

  def destroy
    @group_member = GroupMember.find(params[:id])

    @group_member.destroy

    if URI(request.referer).path == "/group_members/#{@group_member.id}"
      redirect_to("/", :notice => "Group member deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Group member deleted.")
    end
  end
end
