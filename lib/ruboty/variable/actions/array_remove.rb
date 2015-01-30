module Ruboty
  module Variable
    module Actions
      class ArrayRemove < Ruboty::Variable::Actions::Variable
        def call(key, values)
          case var.type(key)
            when 'array'
              values.split(/\s+/).each {|value| remove(key, value)}
            when nil
              message.reply(undefined_message(key))
            else
              message.reply(type_error_message(key))
          end
        end

        def remove(key, value)
          if var.array_include?(key, value)
            var.array_remove(key, value)
            message.reply(remove_message(key, value))
          else
            message.reply(not_found_message(key, value))
          end
        end

        def remove_message(key, value)
          "Remove #{value} from #{key}"
        end

        def not_found_message(key, value)
          "#{value} is not found in #{key}"
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

