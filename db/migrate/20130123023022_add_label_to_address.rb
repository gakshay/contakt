class AddLabelToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :label, :string
  end
end
