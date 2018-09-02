class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.text :premise
      t.string :url
      t.integer :upvote
      t.integer :downvote

      t.timestamps
    end
  end
end
