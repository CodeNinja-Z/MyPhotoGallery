class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.integer :uid
      t.string :fullname
      t.string :avatar
      t.string :token
      t.string :token_secret

      t.timestamps
    end
  end
end
