class AddColorIdToProductVariants < ActiveRecord::Migration
  def change
    add_column :product_variants, :color_id, :integer
  end
end
