class UsersController < ApplicationController
    before_action :require_logged_in, only: [:index, :show]
    before_action :require_logged_out, only: [:new, :create]
    
    def new
        @user = User.new
        render :new
    end

    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            @user = User.new(username: params[:username])
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
