module Ruboty
  module Variable
    module Actions
      class Variable < Ruboty::Actions::Base
        def initialize(message)
          super
          @var = Ruboty::Variable::Variable.new(message)
        end

        def set(key, value)
          if @var.has_key?(key)
            message.reply("Overwrite #{value} to #{key}")
          else
            message.reply("Set #{value} to #{key}")
          end

          @var.set(key, value)
        end

        def get(key)
          if @var.has_key?(key)
            message.reply(@var.get(key))
          else
            message.reply("Undefined #{key}")
          end
        end

        def delete(key)
          if @var.has_key?(key)
            @var.delete(key)
            message.reply("Deleted #{key}")
          else
            message.reply("Undefined #{key}")
          end
        end
      end
    end
  end
end
