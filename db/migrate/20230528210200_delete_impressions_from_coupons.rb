class DeleteImpressionsFromCoupons < ActiveRecord::Migration[7.0]
  def change
    remove_column :coupons, :impressions
  end
end
