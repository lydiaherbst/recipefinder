require 'bundler'
Bundler.require
require 'bcrypt'

require './config/environment.rb'
require './app/models/user.rb'

class ApplicationController < Sinatra::Base
configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  
      enable :sessions
  set :session_secret, 'recipefinder'
   end 
  
  get '/' do
    erb :index
  end
    get '/findfood' do
      erb :findfood
  end

 get '/addfood' do
    
  end

  post '/login' do
    @user = User.find(params[:username])

    if @user
      session[:user_id] = @user
    end

    erb :index
  end
get '/signup' do
  erb :signup
  end

 post '/signup' do
   
  end

end
  

  
  
  
  
