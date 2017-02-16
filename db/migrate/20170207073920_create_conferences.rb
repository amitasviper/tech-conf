class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :title
      t.string :location
      t.string :description
      t.string :url
      t.string :start_date
      t.string :end_date

      t.timestamps null: false
    end
  end
end
