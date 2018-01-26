class AddVadhuvarSirnameToVadhuvars < ActiveRecord::Migration[5.0]
  def change
    add_column :vadhuvars, :vadhuvar_sirname, :string, null: false,default: ""
    change_column :vadhuvars, :father_name,:string,null: false,default: ""
  end
end
