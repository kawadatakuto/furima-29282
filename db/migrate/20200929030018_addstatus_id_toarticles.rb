class AddstatusIdToarticles < ActiveRecord::Migration[6.0]
  def change
    add_column  :articles, :status_id, :integer
    add_column  :articles, :delivery_fee_id, :integer
    add_column  :articles, :delivery_area_id, :integer
    add_column  :articles, :delivery_time_id, :integer
  end
end
