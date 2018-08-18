require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :layout
  end

  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    @user = User.create(params[:user])
    if @user.save && @user.username != ""
      redirect to "tweets/tweets"
    end
  end

  get 'tweets/tweets' do
    erb :'tweets/tweets'
  end

end
