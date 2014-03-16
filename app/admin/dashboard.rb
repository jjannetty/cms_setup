ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Edits" do
          IntegrationEdit.order(updated_at: :desc).last(10).map do |edit|
            render partial: "layouts/recent_edits", locals: {edit: edit}
          end
        end
      end
    end
  end
end
