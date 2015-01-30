require "ruboty/variable/version"
require "ruboty/handlers/variable"

module Ruboty
  module Variable
    class Variable
      NAMESPACE = 'variable'

      def initialize(message)
        @message = message
      end

      def set_value(key, value)
        values[key] = value
      end

      def get_value(key)
        if values.has_key?(key)
          nil
        else
          values[key]
        end
      end

      def values
        @message.robot.brain.data[NAMESPACE] ||= {}
      end
    end
  end
end
