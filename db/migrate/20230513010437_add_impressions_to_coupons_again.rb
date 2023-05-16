class AddImpressionsToCouponsAgain < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :impressions, :integer
  end
end
