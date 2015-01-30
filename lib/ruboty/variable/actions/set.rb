module Ruboty
  module Variable
    module Actions
      class Set < Ruboty::Variable::Actions::Variable
        def call(key, value)
          had_key = var.data.has_key?(key)

          var.set(key, value)

          message.reply(
            if had_key
              overwrite_message(key, value)
            else
              set_message(key, value)
            end
          )
        end

        def set_message(key, value)
          "Set #{value} to #{key}"
        end

        def overwrite_message(key, value)
          "Overwrite #{value} to #{key}"
        end
      end
    end
  end
end

