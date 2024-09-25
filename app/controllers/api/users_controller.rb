class Api::UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:sign_up,:login]
    rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

    def sign_up 
        user = User.create!(user_params)
        @token = encode_token(user_id: user.id)
        render json: {
            user: user, 
            token: @token
        }, status: :created
    end

     def me 
        render json: current_user, status: :ok
    end

    
        def login 
            @user = User.find_by!(username: login_params[:username])
            if @user && @user.valid_password?(login_params[:password])
                @token = encode_token(user_id: @user.id)
                render json: {
                    user: @user,
                    token: @token
                }, status: :accepted
            else
                render json: {message: 'Incorrect password'}, status: :unauthorized
            end
        end


        def find_nearby_users
            current_location = [params[:latitude], params[:longitude]]
            radius = params[:radius] || 50 # Default radius of 10 kilometers
        
            nearby_users = User.near(current_location, radius)
            
            render json: nearby_users, status: :ok
        end
    
    


    private

    def user_params 
        params.require(:user).permit(:username, :name, :password, :email)
    end

    def login_params 
        params.permit(:username, :password)
    end

    def handle_invalid_record(e)
            render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
