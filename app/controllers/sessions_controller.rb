class SessionsController < ApplicationController
    def new
    end

    def create
        if user = User.authenticate(params[:email], params[:password])        
            session[:user_id] = user.id
            flash[:notice] = "Welcome back, #{user.name}"
            redirect_to(session[:intended_url] || user)
            session.delete(:intended_url)
        else
            flash[:notice] = "Sorry ! Invalid credentials"
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
end
