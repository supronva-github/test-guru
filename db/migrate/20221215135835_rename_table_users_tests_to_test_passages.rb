class RenameTableUsersTestsToTestPassages < ActiveRecord::Migration[6.1]
  def change
    rename_table :users_tests, :test_passages
  end
end
