class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string    :zip_code,      null: false
      t.integer   :area_id,       null: false
      t.string    :city,          null: false
      t.string    :address_line,  null: false
      t.string    :building_name
      t.string    :tell,          null: false
      t.references :purchase,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
