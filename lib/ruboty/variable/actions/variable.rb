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

        def variable_descriptions
          key_len = [max_key_length, 'key'.size].max
          mes = "%-#{key_len}s   value\n" % 'key'
          mes << @var.values.map do |k, v|
            "%-#{key_len}s - #{v}" % "#{k}"
          end.join("\n")
        end

        def max_key_length
          @var.values.keys.map(&:size).max
        end
      end
    end
  end
end
