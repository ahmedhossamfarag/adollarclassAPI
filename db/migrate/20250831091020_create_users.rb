class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :experience
      t.string :email
      t.integer :role
      t.string :specialty
      t.string :qualifications
      t.string :password
      t.string :portfolio

      t.timestamps
    end
  end
end
