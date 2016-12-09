class AddCount < ActiveRecord::Migration
  def change
    add_column :urls, :count, :integer, :default => 0
  end
end
