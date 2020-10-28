class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :category_id
      t.string :medium
      t.string :tools
    end
  end
end
