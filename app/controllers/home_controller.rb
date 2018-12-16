class HomeController < ApplicationController
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
end