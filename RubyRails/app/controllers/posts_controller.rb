class PostsController < ApplicationController
 
  def new
       @post = Post.new
  end
  
  # 以下を追加
  def create
      # ストロングパラメーターを使用
       post = Post.new(post_params)
      # DBへ保存する
       post.save
      # 新規投稿画面へリダイレクト
      redirect_to '/posts/new'
  end
  def index
    @posts=Post.all
  end
  def show
    @post=Post.find(params[:id])
  end

  private
 
  def post_params
      params.require(:post).permit(:title, :body, :category)
  end
end