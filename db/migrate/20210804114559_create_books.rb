class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, null: false, foreign_key: true
      t.intiger :publication_year
      t.string :genre

      t.timestamps
    end
  end
end