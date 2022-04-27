class GroupsController < ApplicationController
  def index;
    @groups = current_user.groups.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      flash[:notice] = 'Group created'
      redirect_to groups_path
    else
      flash[:alert] = 'Group not created'
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
