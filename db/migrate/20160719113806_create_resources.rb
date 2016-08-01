# frozen_string_literal: true
class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :link, null: false
      t.timestamps null: false
    end
  end
end
