require "ruboty/variable/actions/variable"

module Ruboty
  module Handlers
    class Variable < Base
      on /var (?<key>\S+?) (?<value>\S+?)\z/, name: 'set_value', description: 'Set value'
      on /var (?<key>\S+?)\z/, name: 'get_value', description: 'Get value'

      def get_value(message)
        Ruboty::Variable::Actions::Variable.new(message).get_value(message[:key])
      end

      def set_value(message)
        Ruboty::Variable::Actions::Variable.new(message).set_value(message[:key], message[:value])
      end
    end
  end
end
