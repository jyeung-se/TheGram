class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :caption
      t.string :picture

      t.string :comment
      t.integer :like

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
