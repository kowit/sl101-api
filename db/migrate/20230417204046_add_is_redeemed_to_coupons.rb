class AddIsRedeemedToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :is_redeemed, :boolean
  end
end
