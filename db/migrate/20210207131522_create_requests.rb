class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :status
      t.integer :quantity
      t.belongs_to :user
      t.references :operator, foreign_key: { to_table: :users }
      t.belongs_to :product
      t.timestamps
    end
  end
end
