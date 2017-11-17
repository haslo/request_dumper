class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.text :headers
      t.text :body
      t.timestamps
    end
  end
end
