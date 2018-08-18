class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect to '/tweets'
    end
  end

  post '/signup' do
    @user = User.create(params[:user])
    if @user.save && @user.username != ""
      redirect to "/tweets"
    else
      redirect to "/signup"
    end
  end

end
