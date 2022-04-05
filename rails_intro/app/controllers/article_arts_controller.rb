class ArticleArtsController < ApplicationController
  
  before_action :set_article_art, only: %i[show edit update destroy]

  def index
    @article_arts = ArticleArt.all
  end

  def show
  end

  def new
    @article_art = ArticleArt.new
    # @article.article_arts.build
  end

  def edit
  end

  def create
    @article_art = ArticleArt.new(article_art_params)

    if @article_art.save
      redirect_to @article_art, notice: "Article art was successfully Created."
    else
      render :new, status: :bad_request
    end
  end

  def update
    if @article_art.update(article_art_params)
      redirect_to article_art_path(@article_art), notice: "Article art was successfully updated."
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    @article_art.destroy
    redirect_to article_arts_path, notice: 'Article art was successfully destroyed.'
  end

  private

  def set_article_art
    @article_art = ArticleArt.find(params[:id])
  end

  def article_art_params
    params.require(:article_art).permit(
      :article_id, :name, :likes,
        article_art_comments_attributes: [
          :id, :body, :_destroy      
        ]
    )
  end
  
end
