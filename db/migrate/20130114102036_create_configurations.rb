class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.integer :service_id
      t.integer :user_id
      t.boolean :status, :default => true
      t.timestamps
    end
  end
end
