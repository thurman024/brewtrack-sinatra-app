class BeerController < ApplicationController

  get '/beers' do
    @beers = Beer.all
    erb :'beers/index'
  end

  get '/beers/new' do
    if logged_in?
      erb :'beers/create'
    else
      #error message
      redirect '/login'
    end
  end

  post '/beers'
end
