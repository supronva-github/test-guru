class AddNullCheckConstraintForColumn < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)

    change_column_null(:questions, :body, false)

    change_column_null(:answers, :body, false)
    change_column_null(:answers, :body, false)

    change_column_null(:users, :first_name, false)
    change_column_null(:users, :last_name, false)
    change_column_null(:users, :role, false)
    change_column_null(:users, :email, false)

    change_column_null(:categories, :title, false)
  end
end
