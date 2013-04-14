class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.point :lnglat, :geographic => true

      t.timestamps
    end

    add_index :photos, :lnglat, spatial: true
  end
end
