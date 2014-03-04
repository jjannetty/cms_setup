class CreateIntegrations < ActiveRecord::Migration
  def change
    create_table :integrations do |t|

      t.timestamps
    end
  end
end
