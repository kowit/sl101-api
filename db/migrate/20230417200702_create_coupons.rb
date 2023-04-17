class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons, id: :uuid do |t|
      t.string :name
      t.string :discount_code
      t.datetime :start_date

      t.timestamps
    end
  end
end
