class CommentsController < ApplicationController
  def create
    
    @prototype=Prototype.find(params[:prototype_id])
    @comment=@prototype.comments.new(comment_params)
    @comments=@prototype.comments.all
    if @comment.save
       redirect_to prototype_path(@prototype)
    else
      render "prototypes/show" 
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id:current_user.id)
  end

end
