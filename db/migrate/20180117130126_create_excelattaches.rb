class CreateExcelattaches < ActiveRecord::Migration[5.0]
  def change
    create_table :excelattaches do |t|
      t.string :excel
      t.integer :user_id

      t.timestamps
    end
  end
end
