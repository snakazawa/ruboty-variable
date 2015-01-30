require "ruboty/variable/actions/variable"
require "ruboty/variable/actions/set"
require "ruboty/variable/actions/get"
require "ruboty/variable/actions/delete"
require "ruboty/variable/actions/list"
require "ruboty/variable/actions/array_init"
require "ruboty/variable/actions/array_push"
require "ruboty/variable/actions/array_remove"

module Ruboty
  module Handlers
    class Variable < Base
      on /var set (?<key>\S+?) (?<value>\S+?)\z/, name: 'set_value', description: 'Set value'
      on /var get (?<key>\S+?)\z/, name: 'get_value', description: 'Get value'
      on /var delete (?<key>\S+?)\z/, name: 'delete_value', description: 'Delete value'
      on /var list\z/, name: 'list_values', description: 'Show values list'
      on /var array init (?<key>\S+?)\z/, name: 'array_init', description: 'Create empty array or clear array'
      on /var array push (?<key>\S+?) (?<values>.+?)\z/, name: 'array_push', description: 'Push values to array'
      on /var array remove (?<key>\S+?) (?<values>.+?)\z/, name: 'array_remove', description: 'Remove values from array'

      def get_value(message)
        Ruboty::Variable::Actions::Get.new(message).call(message[:key])
      end

      def set_value(message)
        Ruboty::Variable::Actions::Set.new(message).call(message[:key], message[:value])
      end

      def delete_value(message)
        Ruboty::Variable::Actions::Delete.new(message).call(message[:key])
      end

      def list_values(message)
        Ruboty::Variable::Actions::List.new(message).call
      end

      def array_init(message)
        Ruboty::Variable::Actions::ArrayInit.new(message).call(message[:key])
      end

      def array_push(message)
        Ruboty::Variable::Actions::ArrayPush.new(message).call(message[:key], message[:values])
      end

      def array_remove(message)
        Ruboty::Variable::Actions::ArrayRemove.new(message).call(message[:key], message[:values])
      end
    end
  end
end
