class CreateImpressions < ActiveRecord::Migration[5.0]
  def change
    create_table :impressions do |t|
      t.integer :total_visitors
      t.integer :today_visitors
      t.timestamps
    end
  end
end
