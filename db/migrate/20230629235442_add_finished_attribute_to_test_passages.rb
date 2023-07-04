class AddFinishedAttributeToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :finished, :boolean, default: false
  end
end
