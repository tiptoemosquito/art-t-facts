class CategoriesController < ApplicationController

    get '/categories' do

        @categories = current_user.categories
        erb :'/categories/index'
    end

    post '/logout' do
        redirect '/users'
    end

    get '/categories/new' do
        erb :'/categories/new'
    end

    post '/categories' do
        @category = Category.create(art_form: params[:art_form], 
        medium: params[:medium], 
        tools: params[:tools])
        redirect "/categories/#{category.id}"
    end

    get '/categories/:id' do
        @category = Category.find(params[:id])
        erb :'/categories/show'
    end

    get '/categories' do
        @categories = Category.all 
        erb :'/categories/index'
    end

    get '/categories/:id/edit' do
        @category = Category.find(params[:id])
        erb :'/categories/edit'
    end

    patch '/categories/:id' do
        @category = Category.find(params[:id])
        @category.update(art_form: params[:art_form], 
        medium: params[:medium], 
        tools: params[:tools])
        redirect "/categories/#{category.id}"
    end

    delete '/category/:id' do
        @category = Category.find(params[:id])
        @category.destroy
    end


end