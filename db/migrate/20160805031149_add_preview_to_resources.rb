class AddPreviewToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :preview, :json
  end
end
