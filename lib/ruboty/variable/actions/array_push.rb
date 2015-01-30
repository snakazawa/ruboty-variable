module Ruboty
  module Variable
    module Actions
      class ArrayPush < Ruboty::Variable::Actions::Variable
        def call(key, values)
          case var.type(key)
            when 'array'
              values.split(/\s+/).each {|value| push(key, value)}
            when nil
              message.reply(undefined_message(key))
            else
              message.reply(type_error_message(key))
          end
        end

        def push(key, value)
          if var.array_include?(key, value)
            message.reply(included_message(key, value))
          else
            var.array_push(key, value)
            message.reply(push_message(key, value))
          end
        end

        def included_message(key, value)
          "#{key} already included #{value}"
        end

        def push_message(key, value)
          "Push #{value} to #{key}"
        end

        def type_error_message(key)
          "#{key} is not array type"
        end

        def undefined_message(key)
          "Undefined #{key}"
        end
      end
    end
  end
end

