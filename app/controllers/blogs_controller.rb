class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    #Blogモデル内のすべてのデータを取得
    
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
    #modelにデータを入れると入れる場所がないと返される
    #なので空き容量をつくってあげるイメージ
    #空のモデルにはカラム名等なにも入っていないので注意.
    
    #@blog=モデルではないことは覚えておく.
    #viewファイルに値を引き渡せすための入れ物なので中身はなんでも可(数字,文字,モデル等)
    
    #プログラミングは中身(右辺)=箱(左辺):中身を箱に代入するという意味で使用．左辺と右辺が等しいではない．結果は一緒だがニュアンスが異なるため忘れないように!!
  end
  
  def create
   blog = Blog.new(blog_params)
   blog.save
   redirect_to blogs_path(blog.id)
   
  end

  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    
    redirect_to blog_path(blog)
    #(blog.id)ではない？→idの記述は省略可能
  end
  
  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
    #redirect_to およびlink_toはHTTPメソッドをなにも指定しない場合はGETが使用される
    
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end