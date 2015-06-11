class ItemsController < ApplicationController
    skip_before_filter :verify_authenticity_token

	def new
		@user=User.find_by_id(params[:user_id])
		@item=@user.items.build
	end

	def index
	  @user=User.find_by_id(params[:user_id])	
      @items=@user.items
	end

	def show
		@user=User.find_by_id(params[:user_id])	
		@item=Item.find(params[:id])
	end

	
    def create
        @user = User.find_by_id(params[:user_id])
        @users=User.all
        @item = Item.new(permitted_params)
        respond_to do |format|
        if @item.save
        format.html { redirect_to user_item_path(@user,@item), notice: 'User was successfully created.' }
        format.js {}
        else
        format.html { render :new }
        format.js { render :new }
        end
     end
 end
		

	 private
	 def permitted_params
	 	params.require(:item).permit(:name, :price, :avatar)
	 end
   end
