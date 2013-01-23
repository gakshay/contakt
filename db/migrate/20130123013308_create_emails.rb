class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :label
      t.string :email
      t.integer :address_id

      t.timestamps
    end
  end
end
