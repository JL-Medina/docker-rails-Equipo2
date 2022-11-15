class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :name
      t.string :lastname
      t.integer :phone
      t.string :address
      t.date :fecha_nac
      t.timestamps
    end
  end
end
