class Property < ApplicationRecord
  belongs_to :agent
  has_one :address

  def self.by_city(city)
    select('properties.id, price, beds, baths, sq_ft')
    .join('INNER JOIN addresses a ON a.prperty_id = prperties.id')
    .where('LOWER(a.city) = ? AND prperties.sold <> TRUE', city.downcase)
  end

  #Property.available
  def self.available
    #property id, price, beds, baths, sq_ft, city zip street, agent first_name, agent last name, agent email, agent id
    #property table, agent table, address table

    select('properties.id, price, beds, baths, sq_ft,
            ad.city, ad.zip, ad.street,
            a.first_name, a.last_name, a.email, a.id AS agent_id')
    .joins('INNER JOIN agents a ON a.id = properties.agent_id
            INNER JOIN addresses ad ON ad.property_id = properties.id')
    .where('properties.sold <> TRUE')
    .order('a.id')
  end
end
