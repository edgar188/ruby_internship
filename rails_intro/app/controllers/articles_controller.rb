class ArticlesController < ApplicationController
  
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all

    # @article_art_comments = @article.article_arts.find(params[:id]).article_art_comments
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
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    ## Get article by id
    @article = Article.find(params[:id])
  end
  
  def article_params
    ## Strong parameter
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