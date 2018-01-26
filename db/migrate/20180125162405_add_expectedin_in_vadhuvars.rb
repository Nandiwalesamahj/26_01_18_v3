class AddExpectedinInVadhuvars < ActiveRecord::Migration[5.0]
  def change
 	
 	add_column :vadhuvars, :exp_color, :string 
 	add_column :vadhuvars, :exp_age, :integer 
 	add_column :vadhuvars, :exp_height, :string 
 	add_column :vadhuvars, :exp_education, :string 
 	add_column :vadhuvars, :exp_weight, :string

  end
end
