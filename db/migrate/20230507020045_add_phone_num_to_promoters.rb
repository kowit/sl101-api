class AddPhoneNumToPromoters < ActiveRecord::Migration[7.0]
  def change
    add_column :promoters, :phone_num, :string
  end
end
