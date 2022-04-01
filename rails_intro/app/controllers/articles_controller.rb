class ArticlesController < ApplicationController
  before_action :set_article, only: %i[update show destroy edit]

  def index
    @articles = Article.all
  end

  def show
    @article_arts = @article.article_arts.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article), notice: 'Article edited.'
  end

  def destroy
    @article.destroy
    redirect_to root_path, notice: 'Article deleted.'
  end

  private

  def article_params
    ## Strong parameter
    params.require(:article).permit(:title, :body, article_arts_attributes: [:id, :name, :_destroy] )
  end

  def set_article
    ## Get article by id
    @article = Article.find(params[:id])
  end
  
end