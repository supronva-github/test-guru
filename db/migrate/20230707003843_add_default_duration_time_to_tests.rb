class AddDefaultDurationTimeToTests < ActiveRecord::Migration[6.1]
  def up
    change_column :tests, :duration_time, :integer, default: 0, null: false
  end

  def down
    change_column :tests, :duration_time, :integer, default: nil, null: true
  end
end
