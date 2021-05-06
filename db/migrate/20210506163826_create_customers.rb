class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |table|
      table.string :name
    end
  end
end
