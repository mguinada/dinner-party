class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :rate
      t.string :author_tip
      t.string :budget
      t.string :prep_time
      t.string :cook_time
      t.string :total_time
      t.string :author
      t.string :difficulty
      t.string :people_quantity
      t.string :tags, array: true, default: [] # Using PostrgreSQL's support for array storage
      t.string :image

      t.timestamps
    end
  end
end
