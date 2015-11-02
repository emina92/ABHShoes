class ChangeProductFields < ActiveRecord::Migration
  def change
  	change_column :products, :title, :string, null:false
  	change_column :products, :price, :string, null:false
  end
end
