class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, except: %i[index new create]
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
    authorize @category, :new?
  end

  def show
    @categories = Category.order(:name)
    @category_links = @category.links.order(:created_at)
  end

  def create
    @category = Category.new(category_params.merge(user_id: current_user.id))
    authorize @category, :create?

    if @category.save
      redirect_to categories_path, notice: 'Category was created successfully'
    else
      render 'new', alert: 'Category was not created'
    end
  end

  def edit; end

  def update
    authorize @category, :update?

    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was updated successfully'
    else
      render 'edit', alert: 'Category was not updated'
    end
  end

  def destroy
    authorize @category, :destroy?

    @category.destroy
    redirect_to categories_path, alert: 'Category was deleted'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
