class AddPasswordDigestToPromoters < ActiveRecord::Migration[7.0]
  def change
    add_column :promoters, :password_digest, :string
  end
end
