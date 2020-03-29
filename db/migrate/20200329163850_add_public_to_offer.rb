class AddPublicToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :public, :bool, null: false, default: false
  end
end
