ActiveAdmin.register Integration do

  permit_params :title, :visible, :requires_button, :difficulty_rating, :connection_type,
    :system_requirements, :custom_instructions, :admin_user_id


  #Active Admin controller override
  controller do
    after_action :update_integration_edits, only: [:create, :update]

    def update_integration_edits
      integration = @integration
      created = integration.created_at
      updated = integration.updated_at
      params.permit(:id)

      if created == updated
        IntegrationEdit.new({integration_id: integration.id, admin_user_id: integration.admin_user_id}).save
      else
        integration_edit = IntegrationEdit.new({
          integration_id: integration.id,
          admin_user_id: current_admin_user.id,
          created_at: integration.created_at})
        integration_edit.save
      end
    end
  end

  filter :title

  index as: :table do
    column :title
    column :visible
    column :requires_button
    column :difficulty_rating
    column :connection_type
    column "Last edited by" do |integration|
      integration.newest_integration_edit.try(:admin_user).try(:email)
    end
    column "Last updated" do |integration|
      integration.updated_at.to_formatted_s(:short)
    end
    actions do |integration|
      link_to 'Show Page', integration_path(integration)
    end
  end

  form do |f|
    f.inputs "Integration Details" do
      f.input :title
      f.input :visible, as: :boolean
      f.input :requires_button, as: :boolean
      f.input :difficulty_rating, as: :select, collection: ['one', 'two', 'three']
      f.input :connection_type, as: :select, collection: ['one', 'two', 'three']
      f.input :system_requirements, as: :text
      f.input :custom_instructions, as: :text
      f.input :admin_user_id, as: :hidden, value: current_admin_user.id
    end
    f.actions
  end

  action_item do
    link_to "View Site", "/integrations"
  end

  action_item only: :show do
    link_to "View Integration", integration_path(integration)
  end
end
