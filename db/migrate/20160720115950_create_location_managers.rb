class CreateLocationManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :location_managers do |t|

      t.timestamps
    end
  end
end
