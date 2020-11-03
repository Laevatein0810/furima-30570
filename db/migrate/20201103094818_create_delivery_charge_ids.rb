class CreateDeliveryChargeIds < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_charge_ids do |t|

      t.timestamps
    end
  end
end
