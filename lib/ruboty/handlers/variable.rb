require "ruboty/variable/actions/variable"

module Ruboty
  module Handlers
    class Variable < Base
      on /var set (?<key>\S+?) (?<value>\S+?)\z/, name: 'set_value', description: 'Set value'
      on /var get (?<key>\S+?)\z/, name: 'get_value', description: 'Get value'
      on /var delete (?<key>\S+?)\z/, name: 'delete_value', description: 'Delete value'
      on /var list\z/, name: 'list_values', description: 'Show values list'
      on /var array init (?<key>\S+?)\z/, name: 'array_init', description: 'Create empty array or clear array'
      on /var array push (?<key>\S+?) (?<value>\S+?)\z/, name: 'array_push', description: 'Push value to array'

      def get_value(message)
        Ruboty::Variable::Actions::Variable.new(message).get(message[:key])
      end

      def set_value(message)
        Ruboty::Variable::Actions::Variable.new(message).set(message[:key], message[:value])
      end

      def delete_value(message)
        Ruboty::Variable::Actions::Variable.new(message).delete(message[:key])
      end

      def list_values(message)
        Ruboty::Variable::Actions::Variable.new(message).list()
      end

      def array_init(message)
        Ruboty::Variable::Actions::Variable.new(message).array_init(message[:key])
      end
    end
  end
end
