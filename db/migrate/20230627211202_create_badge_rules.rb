class CreateBadgeRules < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_rules do |t|
      t.string :name, null: false
      t.string :type
      t.string :options
      t.timestamps
    end
  end
end
