class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :lat
      t.integer :long
      t.boolean :buys
      t.integer :phone
      t.string :email
      t.string :twitter_handle
      t.string :facebook_page

      t.timestamps
    end
  end
end
