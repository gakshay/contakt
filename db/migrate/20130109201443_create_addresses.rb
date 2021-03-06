class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :street_address_two
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.timestamps
    end
  end
end
