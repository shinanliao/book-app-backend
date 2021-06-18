class CreateUserBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_books do |t|
      t.integer :user_id
      t.string :google_books_api_id
      t.text :comments
      t.boolean :have_read

      t.timestamps
    end
  end
end
