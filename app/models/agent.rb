class Agent < ApplicationRecord
  has_many :buyers
  has_many :properties

  def self.by_unsold_homes
    select('agents.id, first_name, last_name, email, sold, COUNT(*) as frequency')
  .joins('INNER JOIN properties p ON p.agent_id = agents.id')
  .where('sold <> TRUE')
  .group('agents.id, first_name, last_name, email, sold')
  .order('COUNT(*) DESC')
  end
end
