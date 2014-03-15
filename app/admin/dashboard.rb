ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Edits" do
          ul do
            IntegrationEdit.order(:updated_at).last(10) do |edit|
              li :for => edit do
                edit.created_at
              end
            end
          end
        end
      end
    end
  end
end
