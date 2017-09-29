class CreateDrafts < ActiveRecord::Migration[5.1]
  def change
    create_table :drafts do |t|
      t.integer :order, array: true, default: []
      t.integer :next_pick_index

      t.timestamps
    end
  end
end
