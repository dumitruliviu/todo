class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :content
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
