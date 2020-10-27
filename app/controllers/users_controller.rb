class UsersController < ApplicationController

    get '/' do
        erb :'/index'
    end

    get '/signup' do
        if !logged_in?
            erb :'users/create_user', locals: {message: "Please signup if you are not already a user."}
        else
            redirect to '/login'
        end
    end

    post '/signup' do 
        # if params[:username] == "" || params[:email] == "" || params[:password] == ""
        #     redirect to '/signup'
        # else
        #     @user = User.create(:name => params[:name], :username => params[:username], :email => params[:email], :password => params[:password])
        #     @user.save
        #     session[:user_id] = @user.id
        #     redirect to '/'
        # end
    end

    get '/login' do
        if !logged_in?
            erb :'/users/login'
        else
            redirect to '/show'
        end
    end

    post '/login' do
        # user = User.find_by(:username => params[:username])
        # if user && user.authenticate(params[:password])
        #   session[:user_id] = user.id
        #   redirect to "/show"
        # else
        #   redirect to '/signup'
        # end
    end
end