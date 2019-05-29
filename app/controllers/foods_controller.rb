class FoodsController < ApplicationController
    before_action :find_food, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit]
    def index
        if params[:category].blank?
            @foods = Food.all.order("created_at DESC")
        else
            @category_id = Category.find_by(name: params[:category]).id
            @foods = Food.where(:category_id => @category_id).order("created_at DESC")
        end
    end
    def show
		if @food.reviews.blank?
			@average_review = 0
		else
			@average_review = @food.reviews.average(:rating).round(2)
		end
	end
    def new
        @food = current_user.foods.build
        @categories = Category.all.map{ |c| [c.name, c.id] }
    end
    def create
        @food =current_user.foods.build(food_params)
        @food.category_id = params[:category_id]
        if @food.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    def edit
        @categories = Category.all.map{ |c| [c.name, c.id] }
    end
    def update
        @food =current_user.foods.build(food_params)
        if @food.update(food_params)
            redirect_to food_path(@food)
        else
            render 'edit'
        end
    end
    def destroy
        @food.destroy
        redirect_to root_path
    end
    private
        def food_params
            params.require(:food).permit(:name, :author, :desciption, :address, :time, :price, :sale, :category_id, :food_img)
        end
        def find_food
            @food = Food.find(params[:id])
        end

end
