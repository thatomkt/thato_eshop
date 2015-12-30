class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal, default: 0, null: false
  end
end
