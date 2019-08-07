class CreatePrivateMassages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_massages do |t|
      t.text :content
      t.references :sender, index: true

      t.timestamps
    end
  end
end
