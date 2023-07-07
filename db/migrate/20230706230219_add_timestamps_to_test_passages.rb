class AddTimestampsToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }, null: false, precision: 6
    add_column :test_passages, :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }, null: false, precision: 6
  end
end
