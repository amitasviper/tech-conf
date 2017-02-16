class Changedatatype2 < ActiveRecord::Migration
  def change
    change_column :conferences, :end_date, 'date USING CAST(end_date AS date)'
  end
end
