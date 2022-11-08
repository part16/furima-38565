class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.references :history,     null: false, foreign_key: true
      t.string     :post_code,   null: false
      t.integer    :ship_id,     null: false
      t.string     :city,        null: false
      t.string     :address,     null: false
      t.string     :building,    null: false
      t.string     :phone_number,null: false
      t.timestamps
    end
  end
end
