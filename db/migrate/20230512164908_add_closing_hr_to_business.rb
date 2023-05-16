class AddClosingHrToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :closing_hr, :string
  end
end
