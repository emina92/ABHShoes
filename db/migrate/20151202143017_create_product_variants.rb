class CreateProductVariants < ActiveRecord::Migration
  def change
    create_table :product_variants do |t|
      t.integer :size
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
