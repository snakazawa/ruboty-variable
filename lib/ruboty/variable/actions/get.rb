module Ruboty
  module Variable
    module Actions
      class Get < Ruboty::Variable::Actions::Variable
        def call(key)
          if var.data.has_key?(key)
            message.reply(var.get(key))
          else
            message.reply(undefined_message(key))
          end
        end

        def undefined_message(key)
          "Undefined #{key}"
        end
      end
    end
  end
end

