class CreateSubs < ActiveRecord::Migration[7.0]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.string :description
      t.references :moderator, foreign_key: {to_table: :users}, null: false
      t.timestamps
    end
  end
end
