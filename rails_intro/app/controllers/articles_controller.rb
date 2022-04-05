class ArticlesController < ApplicationController
  
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show
    @article_arts = @article.article_arts
  end

  def new
    @article = Article.new
    @article.article_arts.build
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: "Article was successfully Created."
    else
      render :new, status: :bad_request
    end
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Article was successfully updated."
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully destroyed.'
  end

  private

  ## Get article by id
  def set_article
    @article = Article.find(params[:id])
  end
  
  ## Strong parameter
  def article_params
    params.require(:article).permit(
      :title, :body, article_arts_attributes: [
        :id, :name, :likes, :_destroy,
          article_art_comments_attributes: [
            :id, :body, :_destroy      
          ]
        ],
    )
  end
  
end