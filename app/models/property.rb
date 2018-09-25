class Property < ApplicationRecord
  belongs_to :agent
  has_one :address

  def self.availible
    select('properties.id, price, beds, baths sq_ft, ad.city, ad.zip, ad.street,
            a.first_name, a.last_name, e.email, a.id AS agent_id')
    .joins('INNER JOIN agents a on a.id = properties.agent_id
            INNER JOIN addresses ad ON ad.prperty_id = properties.id')
    .where('properties.sod <> TRUE')
    .order('a.id')
  end
end
