class CreateBusinessHours < ActiveRecord::Migration[7.0]
  def change
    create_table :business_hours, id: :uuid do |t|
      t.references :business, null: false, foreign_key: true, type: :uuid
      t.integer :day_of_week
      t.time :opening_time
      t.time :closing_time
      t.timestamptz :time_zone

      t.timestamps
    end
  end
end
