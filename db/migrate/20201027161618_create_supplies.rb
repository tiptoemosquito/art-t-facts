class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :medium
      t.string :tools
      t.string :categories_id
    end
  end
end
