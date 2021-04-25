class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_link
  def create
    @comment =
      @link.comments.build(
        comment_params.merge(link_id: @link.id, user_id: current_user.id),
      )
    authorize @comment, :create?
    if @comment.save
      flash[:notice] = 'Comment was created successfully'
      redirect_to @link
    else
      flash[:alert] = 'Comment was not created.'
      redirect_to @link
    end
  end

  private

  def get_link
    @link = Link.find(params[:link_id])
  end

  def comment_params
    params.required(:comment).permit(:body)
  end
end
