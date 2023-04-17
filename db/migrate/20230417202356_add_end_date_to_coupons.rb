class AddEndDateToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :end_date, :datetime
  end
end
