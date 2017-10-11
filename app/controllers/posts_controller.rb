class PostsController < ApplicationController
	
#convention over configuration (CoC)
	def index
		@posts = Post.all.order(created_at: 'desc')
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end
	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
		  redirect_to  posts_path
		else 
		  render 'edit'
		end
	end

	def create
		#render plain: params[:post].inspect
		#render plainでviewを作らずにrender plainでそのままデータを出力、params[:post]でデータを受け取る
		@post = Post.new(post_params) #データを保存する方法
		#悪意のあるデータが挿入されることを防ぐためにデータの形式を検証をするためにstrong parametersを使う
		#requireでチェック
		#送られてきたデータはpostで、titleとbodyがないといけないという意味
		if @post.save
		  flash[:notice] = "You've created!"
		  redirect_to posts_path
		
        else 
          #render plain: @post.errors.inspect
          render 'new' #newと同じviewを表示する
         
        end
	end

	def destroy
		@post = Post.find(params[:id])#記事を特定
		@post.destroy
		flash[:notice] = "Deleted!"
		redirect_to root_path
	end

	private #ここにstrong paraetersをまとめられる
	def post_params
		params.require(:post).permit(:title,:body)

	end
end
