# frozen_string_literal: true

class CreateFeatureFlagsFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :feature_flags_features do |t|
      t.string :name, null: false
      t.boolean :active, default: false, null: false

      t.timestamps
    end
    add_index :feature_flags_features, :name, unique: true
  end
end
