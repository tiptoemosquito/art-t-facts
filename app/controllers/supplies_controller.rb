class SuppliesController < ApplicationController

    get '/categories/:category_id/supplies/new' do
        if logged_in?
            @category_id = params[:category_id].to_i
            erb :'supplies/new'
        else
            redirect '/login'
        end 
    end

    post '/categories/:category_id/supplies' do
        if logged_in?
            category = current_user.categories.find_by(id: params[:category_id])
            supply = category.supplies.create(medium: params[:medium],
            tools: params[:tools])

            redirect "/categories/#{category.id}"
        else 
            redirect '/login'
        end
    end

    get '/supplies/:id/edit' do
        if logged_in?
            @supply = current_user.supplies.find_by(id: params[:id])
            erb :'supplies/edit'
        else 
            redirect '/login'
        end 
    end

    patch '/supplies/:id' do
        if logged_in?
            @supply = current_user.supplies.find_by(id: params[:id])
            if @supply.update(medium: params[:medium], tools: params[:tools])
                redirect  "/categories"
            end
        else
            redirect "/supplies/#{@supply.id}"
        end 
    end
    
    delete '/supplies/:id' do
        if logged_in?
            supply = current_user.supplies.find_by(id: params[:id])
            category = supply.category
            if supply
                supply.destroy
            end
            redirect "/categories/#{category.id}"
        else
            redirect '/login'
        end 
    end 
    
end