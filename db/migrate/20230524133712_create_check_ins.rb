class CreateCheckIns < ActiveRecord::Migration[7.0]
  def change
    create_table :check_ins, id: :uuid do |t|
      t.integer :count
      t.references :business, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
