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
        data[key] = {
            :type => 'string',
            :value => value
        }
      end

      def get(key)
        data[key][:value] if data.has_key?(key)
      end

      def type(key)
        data[key][:type] if data.has_key?(key)
      end

      def array_init(key)
        data[key] = {
            :type => 'array',
            :value => []
        }
      end

      def array_push(key, value)
        data[key][:value] << value unless array_include?(key, value)
      end

      def array_remove(key, value)
        data[key][:value].delete(value) if array_include?(key, value)
      end

      def array_include?(key, value)
        data[key][:value].include?(value) if type(key) == 'array'
      end

      def data
        @values
      end
    end
  end
end
