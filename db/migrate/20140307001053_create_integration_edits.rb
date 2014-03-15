class CreateIntegrationEdits < ActiveRecord::Migration
  def change
    create_table :integration_edits do |t|
      t.references :admin_user
      t.references :integration

      t.timestamps
    end
    add_index :integration_edits, ["admin_user_id", "integration_id"]
  end
end
