class UsersController < ApplicationController
    def show
        @user_now = current_user
    end
end
