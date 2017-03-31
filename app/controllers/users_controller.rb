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
    @users = User.all
    jsonArray = []
    for user in @users do
      userJSON = {id: user.id, nombre: user.name, apellido: user.lastname, usuario: user.username, twitter: user.twitter }
      jsonArray.append(userJSON)
    end
    render json: {usuarios: jsonArray, total: User.count }
  end

  def destroy
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @user.destroy
      render :nothing, status:204
    else
      render json: {error: "Usuario no encontrado"}, :status => 404
    end
  end

  def edit
    if User.exists?(params[:id])
      render json: {wea: params}
    else
      render json: {error: "Usuario no encontrado"}, :status => 404
    end
  end

end
