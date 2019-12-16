module Sinatra
  # module with helper methods
  module ApplicationHelper
    def post_object(item)
      item.as_json(only: %i[id title body])
    end

    def comment_object(item)
      item.as_json(only: %i[id body])
    end
  end
end
