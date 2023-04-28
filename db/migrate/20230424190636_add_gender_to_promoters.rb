class AddGenderToPromoters < ActiveRecord::Migration[7.0]
  def change
    add_column :promoters, :gender, :string
  end
end
