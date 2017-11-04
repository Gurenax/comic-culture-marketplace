module SearchHelper

  def location_radius
    {
      '0km' => '0',
      '2km' => '2000',
      '5km' => '5000',
      '20km' => '20000',
      '50km' => '50000',
      '100km' => '100000',
      '250km' => '250000',
      '500km' => '500000'
    }
  end
end
