class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  
  authorize_resource
  
  def index
    @article = Article.all
  end

  # request
  # headers 头部哈希
  # user_id: user_id
  # body 表单参数 json参数
  # url  url 参数

  # request.headers['user_id']

  def new
    @article = Article.new
    puts current_user.id
    @article.user_id = current_user.id
  end

  # body_params = (form_params + json_params)
  # param = url_params + (form_params + json_params)
  # form_params = 

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:name, :time, :content, :record, :issue,
                                    :task, :explain, :summart, :user_id)
  end
end
