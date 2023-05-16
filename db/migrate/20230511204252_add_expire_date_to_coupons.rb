class AddExpireDateToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :expire_date, :datetime
  end
end
