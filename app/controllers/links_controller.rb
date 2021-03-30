class LinksController < ApplicationController
  before_action :set_link, except: %i[index new create]

  def index
    @links = Link.all
  end

  def show; end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = 'News was created successfully'
      redirect_to @link
    else
      flash.now[:alert] = 'News was not created.'
      render 'new'
    end
  end

  def edit; end

  def update
    if @link.update(link_params)
      flash[:notice] = 'News was edited successfully'
      redirect_to @link
    else
      flash.now[:alert] = 'News was not updated.'
      render 'edit'
    end
  end

  def destroy
    @link.destroy
    flash[:alert] = 'News was deleted.'
    redirect_to links_path
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.required(:link).permit(:title, :url)
  end
end
