class AddExpireTimeToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :expire_time, :string
  end
end
