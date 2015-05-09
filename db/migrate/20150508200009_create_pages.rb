class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.string :name
    	t.string :title
    	t.text :text
    	t.references :parent, index: true
    end
    add_index :pages, :name
  end
end
