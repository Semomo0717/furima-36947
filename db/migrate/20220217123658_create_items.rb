class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string       :title,        null: false
      t.text         :explanation , null: false
      t.integer      :category_id,  null: false
      t.integer      :situation_id, null: false
      t.integer      :shipingcost_id, null: false
      t.integer      :area_id,      null: false
      t.integer      :timeship_id,  null: false
      t.integer      :cost,         null: false
      t.references   :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
