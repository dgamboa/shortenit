class AddNumViewsToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :num_views, :integer
  end
end
