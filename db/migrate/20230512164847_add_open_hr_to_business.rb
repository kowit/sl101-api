class AddOpenHrToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :open_hr, :string
  end
end
