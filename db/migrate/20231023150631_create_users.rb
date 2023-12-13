class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :access_token
      t.string :refresh_token
      t.integer :expires_at
      t.bigint :procore_id

      t.timestamps
    end
  end
end
