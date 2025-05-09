class CreateArchives < ActiveRecord::Migration[8.0]
  def change
    create_table :archives do |t|
      t.string :image
      t.text :caption

      t.timestamps
    end
  end
end
