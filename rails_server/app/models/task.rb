class Task < ApplicationRecord
  def human_priority
    hash = {1 => 'low', 2 => 'medium', 3 => 'high'}
    hash[self.priority]
  end
end
