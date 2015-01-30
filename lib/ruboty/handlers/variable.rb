require "ruboty/variable/actions/variable"

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

      def array_push(message)
        Ruboty::Variable::Actions::Variable.new(message).array_push(message[:key], message[:values])
      end

      def array_remove(message)
        Ruboty::Variable::Actions::Variable.new(message).array_push(message[:key], message[:values])
      end

      on /var test\z/, name: 'test_values', hide: true

      def test_values(message)
        var = Ruboty::Variable::Actions::Variable.new(message)
        puts '# set'
        var.set("hoge", "hoge_value")
        var.set("123457", "999")
        var.set("aohef23", "awef8a23a3a32")
        var.set("string", "string_value")

        puts "\n# get"
        var.get("hoge")
        var.get("piyo")

        puts "\n# list"
        var.list

        puts "\n# delete"
        var.delete("hoge")
        var.delete("hoge")
        var.list

        puts "\n# init array"
        var.array_init("ary")
        var.array_init("string")
        var.array_init("string")
        var.list

        puts "\n# push array"
        var.array_push("ary", "one")
        var.array_push("ary", "two")
        var.array_push("ary", "two")
        var.list

        puts "\n# push array to empty array"
        var.array_push("hoge", "kkkk")
        var.array_push("zxcv", "pppp")

        puts "\n# push values to array"
        var.array_push("ary", "three four five")
        var.list

        puts "\n# remove values from array"
        var.array_remove("ary", "one three")
        var.list

        puts "\n# remove error"
        var.array_remove("ary", "one three")
        var.array_remove("noary", "one")
        var.array_remove("123457", "one")
        var.list
      end
    end
  end
end
