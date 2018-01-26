class AddPublicToVadhuvars < ActiveRecord::Migration[5.0]
  def change
    add_column :vadhuvars, :public, :string
  end
end
