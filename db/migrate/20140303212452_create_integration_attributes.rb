class CreateIntegrationAttributes < ActiveRecord::Migration
  def change
    add_column("integrations", "title", :string)
    add_column("integrations", "visible", :boolean, :default => false)
    add_column("integrations", "requires_button", :boolean, :default => true)
    add_column("integrations", "difficulty_rating", :string, :default => " ")
    add_column("integrations", "connection_type", :string, :default => " ")
    add_column("integrations", "system_requirements", :text, :default => " ")
    add_column("integrations", "custom_instructions", :text, :default => " ")
  end
end
