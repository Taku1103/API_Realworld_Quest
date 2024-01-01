class Api::ArticlesController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]
  before_action :set_article, only: [:show, :update, :destroy]



  def index
    @articles = Article.all
    render json: { status:"success", articles: @articles}
  end

  def show
    render json:  { status: "showing success" , article: @article}
  end

  def create
    @article = Article.new(article_param)
    if @article.save
      render json: { status: "Creating success" ,article: @article }
    else
      render json: { status: "Creating Failed"}
    end
  end

  def update
    if @article.update(article_param)
      render json: { status: "Updating success" , article: @article}
    else
      render json: { status: "Updating Failed"}
    end
  end

  def destroy
    @article.destroy
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_param
    params.require(:article).permit(:title, :description, :body)
  end

end
