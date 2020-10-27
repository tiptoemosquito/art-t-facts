class UsersController < ApplicationController

    # get '/users/:slug' do
    #     @user = User.find_by_slug(params[:slug]) 
    #     erb :'/users/show'
    # end

    # get '/signup' do
    #     if !logged_in?
    #         erb :'users/create_user', locals: {message: "New? Sign Up now! Then sign in once completed!"}
    #     else 
    #         redirect to 'users/singup'
    #     end
    # end

    # post '/signup' do 
    #     if params[:username] == "" || params[:email] == || params[:password] == ""
    #         redirect to 'users/signup'
    #     else 
    #         @user = User.new(:username => params[:username], :email => params[:email], :password => params[:passowrd])
    #         @user.save
    #         session[:user_id] = @user.id 
    #         redirect to 'users/signup'
    #     end
    # end

    # get '/login' do
    #     if !logged_in?
    #         erb :'users/login'
    #     else
    #         redirect to 'users/login'
    #     end 
    # end

    # post '/login' do
    #     user = User.find_by(:username => params[:username])
    #     if user && user.autheniticate(params[:password])
    #         session[:user_id] = user.user_id
    #     else 
    #         redirect to 'users/signup'
    #     end
    # end


end