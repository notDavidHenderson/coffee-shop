class CreateCoffees < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |table|
      table.string :title
    end
  end
end
