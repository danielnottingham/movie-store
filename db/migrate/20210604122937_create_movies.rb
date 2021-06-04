class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.decimal :rent_price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
