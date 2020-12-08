class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create, :login]

    def index
        users = User.All
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: {user: UserSerializer.new(user)}
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: {user: UserSerializer.new(user), token: token}, status: :accepted
        else
            render json: {error: "Failed to update user"}
        end

    end
    
    def create
        user = User.new(user_params)
        if user.save
            token = encode_token(user_id: user.id)
            render json: {user: UserSerializer.new(user), token: token}, status: :created
        else
            render json: {error: "Failed to create a user"}, status: :not_acceptable
        end
    end

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: {user: UserSerializer.new(user), token: token}
        else
            render json: {error: "Incorrect Username or Password"}
        end
    end

    def initialFetch
        render json: { user: UserSerializer.new(logged_in_user) }, status: :accepted
    end

    private
    def user_params 
        params.require(:user).permit(:username, :password, :penname, :bio, :email, :picture)
    end
end
