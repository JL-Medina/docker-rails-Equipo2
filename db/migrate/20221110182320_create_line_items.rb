class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :product, foreign_key: true
      t.integer :quantity
      t.integer :totalprice

      t.timestamps
    end
  end
end
