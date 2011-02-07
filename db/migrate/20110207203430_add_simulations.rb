class AddSimulations < ActiveRecord::Migration
  def self.up
    create_table :simulations do |t|
      t.references :punishment
      t.string :submitted_by
      t.integer :dislike
      t.timestamps
    end
  end

  def self.down
    drop_table :simulations
  end
end
