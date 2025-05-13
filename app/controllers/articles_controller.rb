class ArticlesController < ApplicationController
  def index
    @articles = Article.order(published_on: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end
end
