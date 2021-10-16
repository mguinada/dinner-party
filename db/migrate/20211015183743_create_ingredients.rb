class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :description, index: { unique: true, name: 'unique_descriptions' }

      t.timestamps
    end
  end
end
