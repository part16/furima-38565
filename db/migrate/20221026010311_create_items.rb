class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,               null: false, foreign_key: true
      t.string     :item_name,          null: false
      t.text       :item_discribe,      null: false   
      t.integer    :state_id,           null: false
      t.integer    :category_id,        null: false
      t.integer    :postage_id,         null: false
      t.integer    :ship_id,            null: false
      t.integer    :scheduled_day_id,   null: false
      t.integer    :item_price,         null: false
      t.timestamps
    end
  end
end
