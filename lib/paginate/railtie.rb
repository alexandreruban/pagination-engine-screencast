module Paginate
  class Railtie < ::Rails::Railtie
    initializer "paginate.controller" do
      ActiveSupport.on_load :action_controller_base do
        ActionController::Base.send :include, Paginate::Controller
      end
    end
  end
end
