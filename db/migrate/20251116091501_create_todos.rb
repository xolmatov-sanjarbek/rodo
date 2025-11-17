class CreateTodos < ActiveRecord::Migration[8.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :body
      t.boolean :done
      t.integer :priority

      t.timestamps
    end
  end
end
