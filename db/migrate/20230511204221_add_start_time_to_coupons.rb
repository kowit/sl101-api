class AddStartTimeToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :start_time, :string
  end
end
