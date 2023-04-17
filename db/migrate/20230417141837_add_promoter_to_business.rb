class AddPromoterToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_reference :businesses,
                  :promoter,
                  null: false,
                  foreign_key: true,
                  type: :uuid
  end
end
