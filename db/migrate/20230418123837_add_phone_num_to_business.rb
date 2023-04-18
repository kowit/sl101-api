class AddPhoneNumToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :phone_num, :string
  end
end
