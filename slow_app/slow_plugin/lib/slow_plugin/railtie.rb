module SlowPlugin
  class Railtie < ::Rails::Railtie
    module MyExtension
    end

    initializer "slow_initializer" do
      ActionController::Base.include(MyExtension)
    end
  end
end
