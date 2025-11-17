class AddDefaultDoneToTodos < ActiveRecord::Migration[8.1]
  def change
    change_column_default :todos, :done, false
  end
end
