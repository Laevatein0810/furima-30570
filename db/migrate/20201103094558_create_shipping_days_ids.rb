class CreateShippingDaysIds < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_days_ids do |t|

      t.timestamps
    end
  end
end
