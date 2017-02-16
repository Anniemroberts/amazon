class AlterUserModel < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_digest, :string
    add_reference :products, :user, foreign_key: true, index: true
    add_reference :reviews, :user, foreign_key: true, index: true
  end
end
