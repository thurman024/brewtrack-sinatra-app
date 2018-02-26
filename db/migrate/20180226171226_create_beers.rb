class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :style_id
      t.integer :brewery_id
    end
  end
end
