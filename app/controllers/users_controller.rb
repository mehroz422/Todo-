class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :update, :show, :destory]
    def new
       @user = User.new  
      
    end
    
    def create         
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Todo was created successfully!"
            redirect_to user_path(@user)        
        else
            render 'new'
        end
    end

    def show 
        
    end

    def edit 
        
    end

    def update 
        
        if @user.update(user_params)
            flash[:notice] = "Todo was successfully updated"
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    def index 
        @users = User.all
    end

    def destroy 
        
        @user.destroy
        flash[:notice]= "Todo was deleted successfully"
        redirected_to users_path
    end 

    private 

    def set_user 
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :description)
    end

end