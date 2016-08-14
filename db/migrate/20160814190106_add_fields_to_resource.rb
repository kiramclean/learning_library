class AddFieldsToResource < ActiveRecord::Migration[5.0]
  def change
    remove_column :resources, :preview
    add_column :resources, :title, :string
    add_column :resources, :description, :text
    add_column :resources, :image_url, :string
    add_column :resources, :cost, :integer
    add_column :resources, :level, :string
  end
end
