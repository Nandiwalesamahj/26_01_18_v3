class AddUserIdToRecruitments < ActiveRecord::Migration[5.0]
  def change
    add_column :recruitments, :user_id, :integer
  end
end
