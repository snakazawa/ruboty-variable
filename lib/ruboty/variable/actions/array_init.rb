module Ruboty
  module Variable
    module Actions
      class ArrayInit < Ruboty::Variable::Actions::Variable
        def call(key)
          was_type = var.type(key)

          var.array_init(key)

          if was_type == 'array'
            message.reply(clear_message(key))
          else
            message.reply(create_message(key))
          end
        end

        def create_message(key)
          "Created #{key} empty array"
        end

        def clear_message(key)
          "Clear #{key} array"
        end
      end
    end
  end
end

