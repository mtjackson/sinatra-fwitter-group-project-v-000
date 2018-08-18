class UsersController < ApplicationController

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
