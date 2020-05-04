class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, index: true
      t.references :gossip, index: true
      t.references :comment, index: true
      t.timestamps
    end
  end
end
