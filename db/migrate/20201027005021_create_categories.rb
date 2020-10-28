class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :art_form
      t.string :medium
      t.string :tools
      t.string :user_id 
    end
  end
end
