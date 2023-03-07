class Icon
  class IconNotInLibraryError < StandardError; end

  LIBRARY = {
    add_circle: "addcircle",
    avatar_circle: "avatarcircle",
    home: "home",
    search: "search",
    sliders: "sliders",
    bubbles: "bubbles",
  }

  def self.library(key)
    icon_id = LIBRARY[key]
    raise IconNotInLibraryError if icon_id.nil?

    icon_id
  end
end
