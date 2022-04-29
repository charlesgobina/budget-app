class EntitiesController < ApplicationController
  def index
    @entities = current_user.entities.all.order(created_at: :desc)
  end

  def show
    @entity = Entity.find(params[:id])
  end

  def new
    @entity = Entity.new
    @groups = current_user.groups
  end

  def create
    @entity = current_user.entities.new(entity_params)
    if @entity.save
      flash[:notice] = 'Transaction created'
      redirect_to entities_path
    else
      flash[:alert] = 'Transaction not created'
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :author_id, :groupe_id)
  end
end
