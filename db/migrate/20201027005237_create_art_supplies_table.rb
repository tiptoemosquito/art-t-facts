class CreateArtSuppliesTable < ActiveRecord::Migration
  def change
    create_table :art_supplies do |t|
      t.string :medium
      t.string :tools
      t.string :categories_id #integer?
    end
  end
end
