class Adress < ApplicationRecord

  belongs_to :advertisement
  geocoded_by :full_adress
  after_validation :geocode

  def full_adress
    "#{number}, #{rue}, #{zip_code} #{ville}, #{country}"
  end

end