class CreateArticleArtComments < ActiveRecord::Migration[6.1]
  def change
    create_table :article_art_comments do |t|
      t.references :article_art,index: true, foreign_key: { on_delete: :cascade }
      t.text :body

      t.timestamps
    end
  end
end
