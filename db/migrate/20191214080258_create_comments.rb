# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
