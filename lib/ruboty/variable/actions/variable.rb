module Ruboty
  module Variable
    module Actions
      class Variable < Ruboty::Actions::Base
        def initialize(message)
          super
          @var = Ruboty::Variable::Variable.new(message)
        end

        protected def var
            @var
        end
      end
    end
  end
end
