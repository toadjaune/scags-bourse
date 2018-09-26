class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :text
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
