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
        @values[key] = value
      end

      def get(key)
        @values[key] if @values.has_key?(key)
      end

      def delete(key)
        @values.delete(key) if @values.has_key?(key)
      end

      def has_key?(key)
        @values.has_key?(key)
      end
    end
  end
end
