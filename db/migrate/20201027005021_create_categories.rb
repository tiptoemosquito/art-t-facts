class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :art_style
      t.string :user_id 
      t.string :supplies_id
    end
  end
end
