class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :email, null: false
      t.integer :subject, default: 0, null: false
      t.text :message, null: false, limit: 400

      t.timestamps
    end
  end
end
