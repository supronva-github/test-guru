class AddActiveStatusToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :active, :boolean, default: false
  end
end
