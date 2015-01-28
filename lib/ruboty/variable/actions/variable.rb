module Ruboty
  module Variable
    module Actions
      class Variable < Ruboty::Actions::Base
        NAMESPACE = 'variable'

        def set_value(key, value)
          if values.has_key?(key)
            message.reply("Overwrite #{value} to #{key}")
          else
            message.reply("Set #{value} to #{key}")
          end

          values[key] = value
        end

        def get_value(key)
          if values.has_key?(key)
            message.reply(values[key])
          else
            message.reply("Undefined #{key}")
          end
        end

        def values
          message.robot.brain.data[NAMESPACE] ||= {}
        end
      end
    end
  end
end
