require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    if logged_in?
      redirect #homepage?
    else
      erb :'users/create'
    end
  end

  post '/signup' do
    if !params[:user][:username].empty? && !params[:user][:password].empty?
      user = User.create(params[:user])
      session[:user_id] = user.id
      redirect #homepage?
    else
      #error message
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect #homepage?
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect #homepage
    else
      #error message
      redirect '/login'
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end
  end

end
