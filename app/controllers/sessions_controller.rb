class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]
    
    def new
  
    end

    def create
        user = User.find_by(username: params[:session][:username])
            if user && user.authenticate(params[:session][:password])
                session[:user_id] = user.id
                flash[:success] = "pogged in successfully"
                redirect_to root_path
            else
                flash.now[:error] = "penis alert"
                render 'new'
            end
    end 

    def destroy
        session[:user_id] = nil
        flash[:notice] = "pogged out succeessffuully"
        redirect_to root_path
    end

    private

    def logged_in_redirect
        if logged_in?
            flash[:error]="You are aleady logged in bwaka"
            redirect_to root_path
        end

    end
end