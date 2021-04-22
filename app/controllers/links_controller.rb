class LinksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_link, except: %i[index new create]
  before_action :check_channel, only: [:create]

  def index
    @links = Link.all.order(created_at: :desc)
    authorize @links, :index?
  end

  def show
    authorize @link, :show?
    @comment = Comment.new
  end

  def new
    @link = Link.new
    authorize @link, :new?
  end

  def create
    @link =
      Link.new(
        link_params.merge(
          user_id: current_user.id,
          channel_id: current_user.channel.id,
        ),
      )
    authorize @link, :create?
    if @link.save
      flash[:notice] = 'News link was created successfully'
      redirect_to @link
    else
      flash.now[:alert] = 'News link was not created.'
      render 'new'
    end
  end

  def edit
    authorize @link, :edit?
  end

  def update
    authorize @link, :update?

    if @link.update(link_params)
      flash[:notice] = 'News link was updated successfully'
      redirect_to @link
    else
      flash.now[:alert] = 'News link was not updated.'
      render 'edit'
    end
  end

  def destroy
    authorize @link, :destroy?

    @link.destroy
    flash[:alert] = 'News was deleted.'
    redirect_to links_path
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.required(:link).permit(:title, :url, :channel_id, :user_id)
  end

  def check_channel
    if current_user.channel.nil?
      flash.now[:notice] = 'You need a channel to create a link'
    end
  end
end
