ActiveAdmin.register Integration do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :visible, :requires_button, :difficulty_rating, :connection_type,
    :system_requirements, :custom_instructions
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column :title
    column :visible
    column :requires_button
    column :difficulty_rating
    column :connection_type
    actions :defaults => false do |integration|
      link_to "View", "/integrations/show/#{integration.id}"
      link_to "edit", edit_admin_integration_path(integration)
    end
  end

  action_item do
    link_to "View Site", "/integrations"
  end
end
