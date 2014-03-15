class IntegrationsController < ApplicationController

  layout 'public'

  def index
    if current_admin_user
      @integrations = Integration.all
    else
      @integrations = Integration.visible.all
    end
  end

  def show
    @integration = Integration.find(params[:id])
    if @integration.visible
      #show the page
    else
      if current_admin_user
        #show page
      else
        redirect_to integrations_path
      end
    end
  end
end
