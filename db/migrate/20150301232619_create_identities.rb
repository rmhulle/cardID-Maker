class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :name
      t.string :enrollment
      t.string :campus
      t.string :picture_url
      t.string :pdf_url
      t.date :last_print
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
