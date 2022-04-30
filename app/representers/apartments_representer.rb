class ApartmentsRepresenter
  def initialize(apartments)
    @apartments = apartments
  end

    def as_json
      @apartments.map do |apartment|
        {
          id: apartment.id,
          name: apartment.name,
          images: apartment_images(apartment),
          description: apartment.description,
          location: apartment.location
        }
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
