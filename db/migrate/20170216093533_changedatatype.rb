class Changedatatype < ActiveRecord::Migration
  def change
    change_column :conferences, :start_date, 'date USING CAST(start_date AS date)'
  end
end
