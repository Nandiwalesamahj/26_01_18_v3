class AddColorAndAgeToVadhuvars < ActiveRecord::Migration[5.0]
  def change
    add_column :vadhuvars, :color, :string
    add_column :vadhuvars, :age, :integer
  end
end
