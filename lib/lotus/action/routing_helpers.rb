require 'lotus/utils/string'

module Lotus
  module Action
    # Routing helper for full stack Lotus web applications.
    #
    # For a given application called <tt>Web::Application</tt>, at runtime
    # Lotus creates a routes factory called <tt>Web::Routes</tt>.
    #
    # Included by default in every controller.
    #
    # @since 0.3.2
    #
    # @example Usage in controller
    #   require 'lotus'
    #
    #   module Web::Controllers::Protected
    #     class Index
    #       include Web::Action
    #
    #       def call(params)
    #         redirect_to routes.root_path
    #       end
    #     end
    #   end
    module RoutingHelpers
      def self.included(base)
        factory = "#{ Utils::String.new(base).namespace }::Routes"

        base.class_eval <<-END_EVAL, __FILE__, __LINE__
          private

          def routes
            #{ factory }
          end
        END_EVAL
      end
    end
  end
end
