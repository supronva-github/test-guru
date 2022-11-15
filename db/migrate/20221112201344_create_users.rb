class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age
      t.string :email, null: false
      t.string :role
      
      t.timestamps
    end
  end
end
