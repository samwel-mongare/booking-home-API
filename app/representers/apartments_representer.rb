class ApartmentsRepresenter
  def initialize(apartments)
    @apartments = apartments
  end

    def as_json
      @apartments.map do |apartment|
        @house_price = apartment.rental ? Rental.where(apartment_id: apartment.id) : Market.where(apartment_id: apartment.id)
        if apartment.rental
        {
          id: apartment.id,
          name: apartment.name,
          images: apartment_images(apartment),
          description: apartment.description,
          location: apartment.location,
          price: @house_price.first.price,
          period: @house_price.first.period
        }
      else
        {
          id: apartment.id,
          name: apartment.name,
          images: apartment_images(apartment),
          description: apartment.description,
          location: apartment.location,
          price: @house_price.first.price
        }
      end
     end
    end

  private

  attr_reader :apartments

  def apartment_images(apartment)
      {
        front: apartment.image1,
        interior: apartment.image2,
        back: apartment.image3
      }
    end
end
