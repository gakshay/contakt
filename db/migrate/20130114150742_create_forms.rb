class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.integer :user_id
      t.string :name
      t.string :mobile
      t.string :email
      t.string :company
      t.text :message
      
      t.timestamps
    end
  end
end
