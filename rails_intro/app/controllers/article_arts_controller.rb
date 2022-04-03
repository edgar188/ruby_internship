class ArticleArtsController < ApplicationController
 
  before_action :set_article
  before_action :set_article_art, only: %i[show edit update destroy]

  def index
    @article_arts = @article.article_arts
  end

  def show
  end

  def new
    @article_art = @article.article_arts.build
  end

  def edit
  end

  def create
    @article_art = @article.article_arts.build(article_art_params)
   
    if @article_art.save  
      redirect_to @article_art
    else
      render :new, status: :bad_request
    end
  end

  def update
    if @article_art.update(article_art_params)
      redirect_to article_article_art_path(@article), notice: 'Article_art was successfully updated.' 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article_art.destroy
    redirect_to article_article_arts_path(@article), notice: 'Article_art was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_article_art
    @article_art = @article.article_arts.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_art_params
    params.require(:article_art).permit(:article_id, :name, :likes)
  end
  
end