class ChangeInRecruitments < ActiveRecord::Migration[5.0]
  def change
  	remove_column :recruitments, :title 
  	remove_column :recruitments, :description
  	add_column :recruitments, :r_name, :string
  	add_column :recruitments, :education, :string
  	add_column :recruitments, :technical_education, :string
  	add_column :recruitments, :phone_no, :string
  	add_column :recruitments, :experience_post, :string
  	add_column :recruitments, :org_name, :string
  	add_column :recruitments, :from, :string
  	add_column :recruitments, :till, :string
    add_column :recruitments, :r_email, :string
    add_column :recruitments, :address, :string
    add_column :recruitments, :r_photo, :string
  end
end
