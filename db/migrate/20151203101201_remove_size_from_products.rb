class RemoveSizeFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :size, :integer
  end
end
