class ChangePublicInVadhuvars < ActiveRecord::Migration[5.0]
  def change
  	 change_column :vadhuvars, :public, :string, default: "No"
  end
end
