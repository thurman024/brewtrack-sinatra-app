class BeerController < ApplicationController

  get '/beers' do
    @beers = Beer.all
    erb :'beers/index'
  end

  get 'beers/new' do
    if logged_in?
      @user = current_user
      erb :'beers/create'
    else
      #error message
      redirect '/login'
    end
  end
end
