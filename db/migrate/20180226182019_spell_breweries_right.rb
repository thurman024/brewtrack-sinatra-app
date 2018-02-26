class SpellBreweriesRight < ActiveRecord::Migration[5.1]
  def change
    rename_table :brewerys, :breweries
  end
end
