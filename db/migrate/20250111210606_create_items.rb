class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :content
      t.boolean :completed
      t.integer :priority, default: 1, null: false
      t.integer :position 
      t.integer :category, default: 1, null: false
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
