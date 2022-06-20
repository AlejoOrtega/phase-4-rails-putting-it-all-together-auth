class SessionsController < ApplicationController
    def create 
        user = User.find(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :ok
        else
            render json: {error: 'Not authorized'}, status: :unauthorized
        end
    end
end
