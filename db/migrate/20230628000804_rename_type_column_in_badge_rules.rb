class RenameTypeColumnInBadgeRules < ActiveRecord::Migration[6.1]
  def change
    rename_column :badge_rules, :type, :parameter
  end
end
