require "ruboty/variable/version"
require "ruboty/handlers/variable"

module Ruboty
  module Variable
    class Variable
      NAMESPACE = 'variable'

      def initialize(message)
        @values = message.robot.brain.data[NAMESPACE] ||= {}
      end

      def set(key, value)
        values[key] = {
            :type => 'string',
            :value => value
        }
      end

      def get(key)
        values[key][:value] if values.has_key?(key)
      end

      def type(key)
        values[key][:type] if values.has_key?(key)
      end

      def array_init(key)
        values[key] = {
            :type => 'array',
            :value => []
        }
      end

      def array_push(key, value)
        values[key][:value] << value if type(key) == 'array'
      end

      def values
        @values
      end
    end
  end
end
