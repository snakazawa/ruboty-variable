module Ruboty
  module Variable
    module Actions
      class Variable < Ruboty::Actions::Base
        def initialize(message)
          super
          @var = Ruboty::Variable::Variable.new(message)
        end

        def set_value(key, value)
          if @var.values.has_key?(key)
            message.reply("Overwrite #{value} to #{key}")
          else
            message.reply("Set #{value} to #{key}")
          end

          @var.set_value(key, value)
        end

        def get_value(key)
          value = @var.values[key]
          if value.nil?
            message.reply("Undefined #{key}")
          else
            message.reply(value)
          end
        end
      end
    end
  end
end
