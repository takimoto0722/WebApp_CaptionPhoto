class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.order(published_on: :desc).page(params[:page])
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_articles_path, notice: "記事を作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: "記事を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path, notice: "記事を削除しました"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :published_on, :thumbnail)
  end
end
