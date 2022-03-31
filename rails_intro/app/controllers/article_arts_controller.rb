class ArticleArtsController < ApplicationController
  before_action :get_article
  before_action :set_article_art, only: [:show, :edit, :update, :destroy]

  # GET /article_arts
  # GET /article_arts.json
  def index
    @article_arts = @article.article_arts
  end

  # GET /article_arts/1
  # GET /article_arts/1.json
  def show
  end

  # GET /article_arts/new
  def new
    @article_art = @article.article_arts.build
  end

  # GET /article_arts/1/edit
  def edit
  end

  # POST /article_arts
  # POST /article_arts.json
  def create
    @article_art = @article.article_arts.build(article_art_params)

        respond_to do |format|
         if @article_art.save  
            format.html { redirect_to article_article_arts_path(@article), notice: 'article_art was successfully created.' }
            format.json { render :show, status: :created, location: @article_art }
         else
            format.html { render :new }
            format.json { render json: @article_art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_arts/1
  # PATCH/PUT /article_arts/1.json
  def update
    respond_to do |format|
      if @article_art.update(article_art_params)
        format.html { redirect_to article_article_art_path(@article), notice: 'article_art was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_art }
      else
        format.html { render :edit }
        format.json { render json: @article_art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_arts/1
  # DELETE /article_arts/1.json
  def destroy
    @article_art.destroy
    respond_to do |format|
      format.html { redirect_to article_article_arts_path(@article), notice: 'article_art was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

   def get_article
     @article = Article.find(params[:article_id])
   end
    # Use callbacks to share common setup or constraints between actions.
    def set_article_art
      @article_art = @article.article_arts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_art_params
      params.require(:article_art).permit(:body, :article_id)
    end
end