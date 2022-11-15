class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.date :expiration_date
      t.date :create_date
      t.integer :quantity_products
      t.integer :total_budget

      t.timestamps
    end
  end
end
