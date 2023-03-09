class Icon
  class IconNotInLibraryError < StandardError; end

  LIBRARY = {
    add_circle: "addcircle",
    avatar_circle: "avatarcircle",
    home: "home",
    search: "search",
    sliders: "sliders",
    bubbles: "bubbles",
    map: "map",
    child: "child",
    broom: "broom",
    laughing: "laughing",
    sadface: "sadface",
    balloons: "balloons",
    tearcalendar: "tearcalendar",
    cleanhand: "cleanhand",
  }

  def self.library(key)
    icon_id = LIBRARY[key]
    raise IconNotInLibraryError if icon_id.nil?

    icon_id
  end
end
