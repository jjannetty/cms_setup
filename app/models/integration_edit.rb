class IntegrationEdit < ActiveRecord::Base
  belongs_to :integration
  belongs_to :admin_user
end
