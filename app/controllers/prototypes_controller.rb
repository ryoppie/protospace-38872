class PrototypesController < ApplicationController
  before_action :user_posted?,only:[:edit]

  before_action :authenticate_user!,except:[:show,:index]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else   
      render :new
    end  
  end

  def show
    @prototype=Prototype.find(params[:id])
    @comment=@prototype.comments.new
    @comments=@prototype.comments.all
  end

  def edit
    @prototype=Prototype.find(params[:id])
  end

  def update
    @prototype=Prototype.find(params[:id])

    if @prototype.update(prototype_params)
      redirect_to  prototype_path
    else
      render :edit
    end
  end

def destroy
  @prototype=Prototype.find(params[:id])
  @prototype.destroy
  redirect_to root_path
end

  private
  def prototype_params
    params.require(:prototype).permit(:image, :title,:catch_copy,:concept).merge(user_id: current_user.id)
  end

  def user_posted?
    @prototype=Prototype.find(params[:id])
    unless current_user && current_user.id==@prototype.user_id
      redirect_to action: :index
      
    end
  end

  end
