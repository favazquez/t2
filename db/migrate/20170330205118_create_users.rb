class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :lastname
      t.string :twitter

      t.timestamps
    end
  end
end
