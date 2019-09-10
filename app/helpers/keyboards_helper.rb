module KeyboardsHelper
  def add_new_keyboard
    if @artist
      new_artist_keyboard_path(@artist, @artist.keyboards.build)
    else
      new_keyboard_path
    end
  end
end
