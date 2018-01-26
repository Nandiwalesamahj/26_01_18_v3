class ChangeFirstNameInUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column :users,:first_name,:string,null: false, default: ""
  	change_column :users,:last_name,:string,null: false, default: ""
  	change_column :users,:middle_name,:string,null: false, default: ""
  end
end
