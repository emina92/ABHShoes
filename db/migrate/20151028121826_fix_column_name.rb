class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :passsword_digest, :password_digest
  end
end
