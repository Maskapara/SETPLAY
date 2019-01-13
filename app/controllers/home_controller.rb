class HomeController < ApplicationController

  before_action :authenticate_user,{only: [:create]}
  before_action :forbid_login_user,{only: [:A_create,:login]}

  def top
    @post = Post.new
  end

  def plan
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create

    @post = Post.new(orgnizer: params[:orgnizer], contact: params[:contact], content: params[:content], game_title: params[:game_title])
    if @post.save
      flash[:notice] = "大会ページを生成しました"
      redirect_to("/home/plan")
    else
      flash[:notice] = "失敗"
      render("/home/top")
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    
    if @user && @user.authenticate(params[:password])
      @error_message = nil
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/home/top")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("/home/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def A_create
    @check = User.find_by(name: params[:name],
                          email: params[:email])

    if @check
      flash[:notice] = "他アカウントの登録情報と重複する為に作成出来ませんでした。"
      @name = params[:name]
      @email = params[:email]
      @password = params[:password]
      redirect_to("/account")
    else
      flash[:notice] = "アカウントを新規作成しました"
      @user = User.new(name: params[:name],
                     email: params[:email],
                     password: params[:password])

      @user.save
      session[:user_id] = @user.id
      redirect_to("/home/top")
    end

  end

end