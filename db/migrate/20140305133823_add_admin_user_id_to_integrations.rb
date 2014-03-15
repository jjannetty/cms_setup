class AddAdminUserIdToIntegrations < ActiveRecord::Migration
  def change
    add_column("integrations", "admin_user_id", :integer)
  end
end
