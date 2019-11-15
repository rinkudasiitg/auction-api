class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.string :bid_amount
      t.integer :bidder_id
      
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
