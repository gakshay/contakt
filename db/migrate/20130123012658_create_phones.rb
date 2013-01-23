class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :label
      t.string :number
      t.integer :address_id

      t.timestamps
    end
  end
end
