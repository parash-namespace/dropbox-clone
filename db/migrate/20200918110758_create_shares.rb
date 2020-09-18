class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|
    	t.references :folder
    	t.references :user
    end
  end
end
