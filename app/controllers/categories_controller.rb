class CategoriesController < ApplicationController

#add authentication, logged_in? 

    get '/categories' do
        if logged_in?
            # binding.pry
            @categories = current_user.categories.uniq
            @supplies = current_user.supplies.uniq
            erb :'categories/index'   
        else
            redirect '/login'
        end
    end

#create
    get '/categories/new' do
        erb :'categories/new'
    end

    post '/categories' do
        @category = current_user.categories.create(
        art_form: params[:art_form]
        )
        redirect "/categories"
    end
# #read
    get '/categories/:id' do
        if logged_in?
            @category = current_user.categories.find_by(id: params[:id])
            if @category
                @supplies = current_user.supplies.where(category_id: params[:id])
                erb :'/categories/show'
            else
                redirect '/categories'
            end
        else
            redirect '/login'
        end
    end


end