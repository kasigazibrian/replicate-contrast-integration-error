# frozen_string_literal: true

# Base class for active record
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
