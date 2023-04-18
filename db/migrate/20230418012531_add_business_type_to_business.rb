class AddBusinessTypeToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_reference :businesses, :business_type, null: false, foreign_key: true, type: :uuid
  end
end
