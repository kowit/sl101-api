class CreatePromoters < ActiveRecord::Migration[7.0]
  def change
    create_table :promoters, id: :uuid do |t|
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
