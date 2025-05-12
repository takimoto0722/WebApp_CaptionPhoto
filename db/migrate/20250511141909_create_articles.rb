class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.date :published_on
      t.string :thumbnail

      t.timestamps
    end
  end
end
