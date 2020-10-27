class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :medium
      t.string :tools
      t.string :user_id 
      t.string :supplies_id
    end
  end
end
