class DropShopTable < ActiveRecord::Migration
  def change
    drop_table :shops

  end
end
