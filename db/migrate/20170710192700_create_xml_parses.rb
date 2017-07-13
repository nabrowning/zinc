class CreateXmlParses < ActiveRecord::Migration[5.1]
  def change
    create_table :xml_parses do |t|
      t.string :xml_url

      t.timestamps
    end
  end
end
