class CategoriesController < ApplicationController

    # get '/categories' do

    #     @categories = current_user.categories
    #     erb :'/categories/index'
    # end

    # post '/logout' do
    #     redirect '/users'
    # end
#create
    get '/categories/new' do
        erb :'/categories/new'
    end

    post '/categories' do
        @category = Category.create(
        art_form: params[:art_form], 
        medium: params[:medium], 
        tools: params[:tools]
        )
        redirect "/categories/#{@category.id}"
    end
#read
    get '/categories/:id' do
        # @categories = current_user.categories
        @category = Category.find(params[:id])
        erb :'/categories/show'
    end

    get '/categories' do
        @categories = Category.all 
        erb :'/categories/index'
    end
#update
    get '/categories/:id/edit' do
        # @categories = current_user.categories
        @category = Category.find(params[:id])
        erb :'/categories/edit'
    end

    patch '/categories/:id' do
        @category = Category.find(params[:id])
        @category.update(
        art_form: params[:art_form],  
        medium: params[:medium], 
        tools: params[:tools]
        )
        redirect "/categories/#{@category.id}"
    end
#delete
    delete '/categories/:id' do
        # @categories = current_user.categories
        @category = Category.find(params[:id])
        @category.destroy
        redirect '/categories'
    end


end