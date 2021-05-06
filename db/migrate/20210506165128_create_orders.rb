class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |table|
      table.references :customer
      table.references :coffee
      table.integer :price
    end
  end
end
