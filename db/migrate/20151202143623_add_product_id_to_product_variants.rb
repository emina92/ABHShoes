class AddProductIdToProductVariants < ActiveRecord::Migration
  def change
    add_column :product_variants, :product_id, :integer
  end
end
