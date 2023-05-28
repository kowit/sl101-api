# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the bin/rails
# db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

promoter = Promoter.create!(
  {
    :email => "janedoe@gmail.com",
    :first_name => "Jane",
    :last_name => "Doe",
    :password => "secret123",
    :gender => "",
    :phone_num =>""
  }
)

business = Business.create!({
  :id => "47e7fa71-1284-4d5b-92fb-380ff6aac27d",
  :name => "True Craves",
  :description => "",
  :promoter_id => promoter.id,
  :business_type_id => "6bd2d732-0bd7-4a97-894f-3d96ed403406",
  :phone_num => "1231231231",
  :website_url => "https://truecraves.com/products/"
})

10.times do
  coupon = Coupon.create!({
    :name => "20% off first on order.",
    :discount_code => "XYZ123",
    :start_date => "06/01/2023",
    :business_id => business.id,
    :end_date => "08/30/23",
    :is_redeemed => false,
    :is_expired => false,
    :max_redemptions => 3,
    :start_time => "",
    :expire_date => "08/30/23",
    :expire_time => "",
    :promo_code => "XYZABC",
  })
end
