class User < ApplicationRecord
  #validates_presence_of :user, :username
  def JSONify
    render json: {id: @user.id, nombre: @user.name, apellido: @user.lastname, usuario: @user.username, twitter: @user.twitter }
  end
end
