class CreateImpressions < ActiveRecord::Migration[7.0]
  def change
    create_table :impressions, id: :uuid do |t|
      t.integer :count
      t.references :coupon, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
