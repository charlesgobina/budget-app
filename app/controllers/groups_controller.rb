class GroupsController < ApplicationController
  def index; end

  def new
    @group = Group.new
  end
  
end
