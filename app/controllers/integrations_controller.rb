class IntegrationsController < ApplicationController
  def index
    @integrations = Integration.all
  end

  def show
    @integration = Integration.find(params[:id])
    puts @integration
  end
end
