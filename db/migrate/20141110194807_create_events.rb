class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :address
      t.float :latitude, :precision=>10, :scale=>6
      t.float :longitude, :precision=>10, :scale=>6
      t.date :start_date
      t.date :end_date
      t.boolean :single_day
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :events, [:user_id, :created_at]
  end
end