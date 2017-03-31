class UsersController < ApplicationController
  def create
    data = JSON.parse(request.body.read)
    if data.first.include? "id"
      render json: {error: "No se puede crear usuario con id"}, :status => 400
      return
    end
    @user = User.new({:name => params[:nombre], :username => params[:usuario], :twitter => params[:twitter], :lastname => params[:apellido] })
    if @user.save
      render json: {id: @user.id, nombre: @user.name, apellido: @user.lastname, usuario: @user.username, twitter: @user.twitter }, :status => 201
    else
      render json: {error:"La creación ha fallado"}, :status => 400
    end
  end

  def show
    if User.exists?(params[:id2])
      @user = User.find(params[:id2])
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
    if User.exists?(params[:id2])
      @user = User.find(params[:id2])
      @user.destroy
      render :nothing, status:204
    else
      render json: {error: "Usuario no encontrado"}, :status => 404
    end
  end

  def edit
    data = JSON.parse(request.body.read)
    if User.exists?(params[:id2])
      @user = User.find(params[:id2])
      if data.count > 1
        render json: {error: "Se puede modificar un parámetro a la vez"}, :status => 500
      else
        if data.first[0] == "id"
          render json: {error: "id no es modificable"}, :status => 400
          return
        end
        if data.first[0] == "nombre"
          @user.name = data.first[1]
        end
        if data.first[0] == "apellido"
          @user.lastname = data.first[1]
        end
        if data.first[0] == "usuario"
          @user.username = data.first[1]
        end
        if data.first[0] == "twitter"
          @user.twitter = data.first[1]
        end
        @user.save
        render json: {id: @user.id, nombre: @user.name, apellido: @user.lastname, usuario: @user.username, twitter: @user.twitter }, :status => 200
      end
    else
      render json: {error: "Usuario no encontrado"}, :status => 404
    end
  end

end
