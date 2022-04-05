class LandingController < ApplicationController

  def index
    @articles = Article.all
    @article_arts = ArticleArt.all
  end

end
