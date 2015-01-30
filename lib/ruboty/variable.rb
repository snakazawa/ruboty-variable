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
        values[key] = value
      end

      def get(key)
        values[key] if values.has_key?(key)
      end

      def values
        @values
      end
    end
  end
end
