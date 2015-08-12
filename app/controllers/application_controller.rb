require 'bundler'
Bundler.require


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
get '/mylist.erb' do

  erb :mylist
end
end
  

  
  
  
  
