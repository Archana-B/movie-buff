class UsersController < ApplicationController

    before_action :set_up_user,  only: [:show, :edit, :update, :destroy]
    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user, notice: "Account created successfully!"
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to @user, notice: "Account has been updated successfully"
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path, notice: "Account successfully deleted!"
    end

private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_up_user
        @user = User.find(params[:id])
    end

end
