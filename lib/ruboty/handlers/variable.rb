require "ruboty/variable/actions/variable"

module Ruboty
  module Handlers
    class Variable < Base
      on /var set (?<key>\S+?) (?<value>\S+?)\z/, name: 'set_value', description: 'Set value'
      on /var get (?<key>\S+?)\z/, name: 'get_value', description: 'Get value'
      on /var delete (?<key>\S+?)\z/, name: 'delete_value', description: 'Delete value'

      def get_value(message)
        Ruboty::Variable::Actions::Variable.new(message).get(message[:key])
      end

      def set_value(message)
        Ruboty::Variable::Actions::Variable.new(message).set(message[:key], message[:value])
      end

      def delete_value(message)
        Ruboty::Variable::Actions::Variable.new(message).delete(message[:key])
      end
    end
  end
end
