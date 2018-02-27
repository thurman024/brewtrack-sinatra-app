class StyleController < ApplicationController

  get '/styles' do
    @styles = Style.all
    erb :'styles/index'
  end

  get '/styles/:id' do

  end
end
