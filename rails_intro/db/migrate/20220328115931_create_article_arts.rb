class CreateArticleArts < ActiveRecord::Migration[6.1]
  def change
    create_table :article_arts do |t|
      t.references :article, index: true, foreign_key: { on_delete: :cascade }
      t.string :name

      t.timestamps
    end
  end
end
