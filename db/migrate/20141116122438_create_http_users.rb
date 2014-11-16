class CreateHttpUsers < ActiveRecord::Migration
  def change
    create_table :http_users do |t|
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
