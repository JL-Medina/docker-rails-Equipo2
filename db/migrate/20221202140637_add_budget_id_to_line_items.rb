class AddBudgetIdToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :budget_id, :integer
  end
end
