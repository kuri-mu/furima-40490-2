class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
   @items = Item.includes(:item_images)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path, flash: { error: @item.errors.full_messages }
    end
  end

  def show
    @item_images = @item.item_images
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @card = CreditCard.where(user_id: current_user).first
  end

  def destroy
    if @item.seller_id == current_user.id
      if @item.destroy
        redirect_to root_path
      else
        render "items/show"
      end
    end
  end

  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end
    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
    if @item.update(item_update_params)
      redirect_to item_path(@item)
    else
      grandchild_category = @item.category
      child_category = grandchild_category.parent
      @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      @category_children_array = []
      Category.where(ancestry: child_category.ancestry).each do |children|
        @category_children_array << children
      end
      @category_grandchildren_array = []
      Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
        @category_grandchildren_array << grandchildren
      end
      def move_to_index
        unless user_signed_in?
          redirect_to action: :index
        end
      end
      render :edit
    end
  end
end
