class CreateStatusIds < ActiveRecord::Migration[6.0]
  def change
    create_table :status_ids do |t|

      t.timestamps
    end
  end
end
