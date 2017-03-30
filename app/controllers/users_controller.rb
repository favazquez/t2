class UsersController < ApplicationController
  def create
    if params[:id]
      render json: {error: "No se puede crear usuario con id"}, :status => 400
    else
      @user = User.new({:name => params[:nombre], :username => params[:usuario] })
      if @user.save
        if params[:apellido]
          @user.lastname = params[:apellido]
        end
        if params[:twitter]
          @user.twitter = params[:twitter]
        end
        render json: {id: @user.id, nombre: @user.name, apellido: @user.lastname, usuario: @user.username, twitter: @user.twitter }, :status => 201
      else
        render json: {error:"La creación ha fallado"}, :status => 400
      end
    end
  end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      render json: {id: @user.id, nombre: @user.name, apellido: @user.lastname, usuario: @user.username, twitter: @user.twitter }, :status => 200
    else
      render json: {error:"Usuario no encontrado"}, :status => 404
    end
  end

  def index
    render json: {status:"trying to show all"}
  end

  def destroy
    render json: {status:"trying to destroy"}
  end

  def edit
    render json: {status:"trying to edit"}
  end

  private
end
