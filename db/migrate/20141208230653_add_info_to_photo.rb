class AddInfoToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :size, :text
    add_column :photos, :shutter, :text
    add_column :photos, :aperture_value, :text
    add_column :photos, :flash, :boolean
    add_column :photos, :camera, :text
    add_column :photos, :focal_length_in35mm_format, :text
    add_column :photos, :iso, :text
    add_column :photos, :make, :text
    add_column :photos, :model, :text
    add_column :photos, :lens_info, :text
    add_column :photos, :lens_model, :text


  end
end
