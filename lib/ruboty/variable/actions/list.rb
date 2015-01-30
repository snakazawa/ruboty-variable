module Ruboty
  module Variable
    module Actions
      class List < Ruboty::Variable::Actions::Variable
        def call
          if var.data.empty?
            message.reply(empty_message)
          else
            message.reply(variable_descriptions, code: true)
          end
        end

        def empty_message
          'Variable is empty'
        end

        def variable_descriptions
          key_len = [max_key_length, 'key'.size].max
          type_len = [max_type_length, 'type'.size].max

          header = "%-#{key_len}s   %-#{type_len}s   value\n" % %w(key type)

          body = var.data.map do |k, v|
            "%-#{key_len}s - %-#{type_len}s - #{v[:value]}" % [k, v[:type]]
          end.join("\n")

          header << body
        end

        def max_key_length
          var.data.keys.map(&:size).max
        end

        def max_type_length
          var.data.values.map {|x| x[:type].size}.max
        end
      end
    end
  end
end
