class UsersController < ApplicationController
    
    before_action :require_sign_in, except: [:new, :create]

    before_action :require_valid_user, only: [:edit, :update, :destroy]
    
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
            session[:user_id] = @user.id
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
        session.delete(:user_id)
        redirect_to users_path, notice: "Account successfully deleted!"
    end

private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_up_user
        @user = User.find(params[:id])
    end

    def require_valid_user
        set_up_user
        unless current_user?(@user)
            redirect_to root_path, notice: "You are not authorized to perform that action!"
        end
    end

end

