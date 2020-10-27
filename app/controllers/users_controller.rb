class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'users/create_user', locals: {message: "Please signup if you are not already a user."}
        else
            redirect to '/login'
        end
    end

    post '/signup' do 
        @user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])

        if @user
            redirect '/login'
        end
    end

    get '/login' do
        if !logged_in?
            erb :'/users/login'
        else
            redirect to '/categories'
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])

        if user && @user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to '/categories'
        else
          redirect to '/signup'
        end
    end
end