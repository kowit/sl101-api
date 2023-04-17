class AddBusinessToCoupon < ActiveRecord::Migration[7.0]
  def change
    add_reference :coupons, :business, null: false, foreign_key: true, type: :uuid
  end
end
