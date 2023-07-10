class Coupon < ApplicationRecord
  belongs_to :business

  has_many :impressions

  def self.get_transform_coupons_for_coupons_table(coupons)
    transformed_coupons = []
    if coupons
      coupons.each_with_index do |coupon, index|
        transformed_coupons.push({
          name: coupon.name,
          maxRedemptions: coupon.max_redemptions.to_i,
          startDate: coupon.start_date.strftime('%m/%d/%Y'),
          expireDate: coupon.expire_date.strftime('%m/%d/%Y')
        })
      end
    end
    return transformed_coupons
  end

end
