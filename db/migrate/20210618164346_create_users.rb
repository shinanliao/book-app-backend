class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :public
      t.string :biography
      t.string :currently_reading

      t.timestamps
    end
  end
end
