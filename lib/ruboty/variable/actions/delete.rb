module Ruboty
  module Variable
    module Actions
      class Delete < Ruboty::Variable::Actions::Variable
        def call(key)
          if var.data.has_key?(key)
            var.data.delete(key)
            message.reply(delete_message(key))
          else
            message.reply(undefined_message(key))
          end
        end

        def delete_message(key)
          "Deleted #{key}"
        end

        def undefined_message(key)
          "Undefined #{key}"
        end
      end
    end
  end
end

