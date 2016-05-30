class CreateCMSPages < ActiveRecord::Migration
  def up
    create_table :cms_pages do |t|
      t.string :controller
      t.string :action
      t.string :ancestry
      t.string :ancestry_depth
      t.string :position
      t.timestamps null: false
    end
    CMS::Page.create_translation_table! title: :string,
                                        url: :string
  end
  def down
    CMS::Page.drop_translation_table!
    drop_table :cms_pages
  end
end
