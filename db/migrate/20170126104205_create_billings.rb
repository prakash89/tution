class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.string :name
      t.string :father_name
      t.string :address
      t.integer :cource_id
      t.float :amount
      t.string :mode_of_payment
      t.string :ref_number
      t.string :order_number

      t.timestamps null: false
    end
  end
end
