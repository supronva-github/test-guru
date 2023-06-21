class AddBadgesImageNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:badges, :image, false)
  end
end
