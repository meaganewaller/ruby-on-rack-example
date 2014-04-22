module RubyOnRackDemo
  ROOT = File.dirname(__FILE__)
end

Dir.glob("{models,controllers}/*").each do |file|
  require File.join(RubyOnRackDemo::ROOT, file)
end

module RubyOnRackDemo
  class App
    def initialize
      @app = Router.new
    end

    def call(env)
      @app.call(env)
    end
  end
end
