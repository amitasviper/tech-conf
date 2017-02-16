class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :title
      t.string :location
      t.string :description
      t.string :url
      t.integer :start_date
      t.integer :end_date

      t.timestamps null: false
    end
  end
end
