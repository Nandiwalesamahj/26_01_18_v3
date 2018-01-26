class ChangeNotNullInUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column :users,:gender,:string,null: false,default: " "
  	change_column :users,:address,:string,null: false,default: " "
  	change_column :users,:work_at_district,:string,null: false,default: " "
  end
end
