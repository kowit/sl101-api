class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses, id: :uuid do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
