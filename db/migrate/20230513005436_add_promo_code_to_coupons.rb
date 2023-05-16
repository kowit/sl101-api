class AddPromoCodeToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :promo_code, :string
  end
end
