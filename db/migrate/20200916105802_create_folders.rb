class CreateFolders < ActiveRecord::Migration[6.0]
  def change
    create_table :folders do |t|
    	t.string :name
    	t.text :folder_description
    	t.integer :owner_id, foreign_key: {to: :user}
    	t.integer :parent_id 

    	t.index :owner_id
    end
  end
end
