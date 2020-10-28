class CategoriesController < ApplicationController

    get '/categories' do
        if logged_in?
            # binding.pry
            @categories = current_user.categories.uniq
            erb :'categories/index'   
        else
            redirect '/login'
        end
    end

#create
    get '/categories/new' do
        @users = current_user.all
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
        @categories = current_user.categories.find_by(id: params[:id])

        if @categories
            erb :'categories/show'
        else
            redirect '/categories'
        end
    end

# #update
    get '/categories/:id/edit' do #loads edit form 
        @category = current_user.find_by(params[:id])
        erb :'categories/edit'
    end

    patch '/categories/:id' do #edits action
        @category = current_user.find_by(params[:id])
        @category.update(
        art_form: params[:art_form] 
        )
        redirect "/categories/#{@category.id}"
    end
# #delete
    delete '/categories/:id' do
        @category = current_user.find_by(params[:id])
        @category.destroy
        redirect '/categories'
    end


end