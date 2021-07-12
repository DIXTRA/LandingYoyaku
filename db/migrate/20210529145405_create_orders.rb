class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.text :comments
      t.string :phone
      t.string :business

      t.timestamps
    end
  end
end
