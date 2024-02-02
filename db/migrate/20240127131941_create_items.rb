class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :item_name,         null: false
      t.text       :item_comment,      null: false
      t.integer    :category_id,       null: false
      t.integer    :itemsituation_id,  null: false
      t.integer    :burden_id,         null: false
      t.integer    :prefecture_id,     null: false
      t.integer    :duration_id,       null: false
      t.integer    :price,             null: false
      t.references :user,              null: false, foreign_key: true
    end
  end
end
