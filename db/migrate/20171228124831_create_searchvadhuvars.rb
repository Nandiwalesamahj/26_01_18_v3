class CreateSearchvadhuvars < ActiveRecord::Migration[5.0]
  def change
    create_table :searchvadhuvars do |t|
      t.integer :user_id
      t.integer :age
      t.string :color
      t.string :education
      t.integer :weight
      t.string :height
      t.string :gender

      t.timestamps
    end
  end
end
