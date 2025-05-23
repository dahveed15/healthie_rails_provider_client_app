class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    add_index :clients, :email, unique: true
  end
end
