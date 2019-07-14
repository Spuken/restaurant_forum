class UsersController < ApplicationController
    def show
        set_user
        @commented_restaurants = @user_checked.restaurants
    end

    def edit
        set_user        
    end

    def update        
        @user_for_update = User.find(params[:id])

        if (current_user == @user_for_update)
            if @user_for_update.update(user_params)
                flash[:notice] = "Updating user content success"
                redirect_to sp_user_path(@user_for_update.id)
            else
                flash.now[:alert] = "User content was failed to update"
                render :edit
            end            
        else
            flash[:alert] = "Can't change other user's data!!!"
            redirect_to root_path
        end
    end

    def set_user
        @user_checked = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :description, :avatar)
    end
end
