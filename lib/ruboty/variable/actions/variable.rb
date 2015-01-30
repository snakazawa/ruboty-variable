module Ruboty
  module Variable
    module Actions
      class Variable < Ruboty::Actions::Base
        def initialize(message)
          super
          @var = Ruboty::Variable::Variable.new(message)
        end

        def set(key, value)
          if @var.values.has_key?(key)
            message.reply("Overwrite #{value} to #{key}")
          else
            message.reply("Set #{value} to #{key}")
          end

          @var.set(key, value)
        end

        def get(key)
          if @var.values.has_key?(key)
            message.reply(@var.get(key))
          else
            message.reply("Undefined #{key}")
          end
        end

        def delete(key)
          if @var.values.has_key?(key)
            @var.values.delete(key)
            message.reply("Deleted #{key}")
          else
            message.reply("Undefined #{key}")
          end
        end

        def list
          if @var.values.empty?
            message.reply('Variable is empty')
          else
            message.reply(variable_descriptions, code: true)
          end
        end

        def array_init(key)
          if @var.type(key) == 'array'
            message.reply("Clear #{key} array")
          else
            message.reply("Created #{key} empty array")
          end
          @var.array_init(key)
        end

        def array_push(key, values)
          values.split(/\s+/).each do |value|
            case @var.type(key)
              when 'array'
                @var.array_push(key, value)
                message.reply("Push #{value} to #{key}")
              when nil
                message.reply("Undefined #{key}")
              else
                message.reply("#{key} is not array type")
            end
          end
        end

        def variable_descriptions
          key_len = [max_key_length, 'key'.size].max
          type_len = [max_type_length, 'type'.size].max

          mes = "%-#{key_len}s   %-#{type_len}s   value\n" % %w(key, type)
          mes << @var.values.map do |k, v|
            "%-#{key_len}s - %-#{type_len}s - #{v[:value]}" % [k, v[:type]]
          end.join("\n")
        end

        def max_key_length
          @var.values.keys.map(&:size).max
        end

        def max_type_length
          @var.values.values.map {|x| x[:type].size}.max
        end
      end
    end
  end
end
