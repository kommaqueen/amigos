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
    heart: "heart",
    envelope: "envelope",
    bell: "bell",
    chats: "chats",
    group: "group",
    star: "star",
    calendar: "calendar",
    clock: "clock",
    marker: "marker",
    plus: "plus",
  }

  def self.library(key)
    icon_id = LIBRARY[key]
    raise IconNotInLibraryError if icon_id.nil?

    icon_id
  end
end
