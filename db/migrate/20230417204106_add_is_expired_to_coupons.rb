class AddIsExpiredToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :is_expired, :boolean
  end
end
