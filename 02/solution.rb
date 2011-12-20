class Collection
  
  def initialize(input, artist_tags)
    @collection = []
    input.each_line do |line|
      song_info = line.split('.')
      song_info.each { |entry| entry.strip }
      @collection << Song.new(artist_tags, *song_info)
    end
  end

  def find(criteria)
    songs = Array.new(@collection)
    songs = filter_by_name(songs, criteria[:name]) if criteria[:name]
    songs = filter_by_artist(songs, criteria[:artist]) if criteria[:artist]
    songs = filter_by_tags(songs, criteria[:tags]) if criteria[:tags]
    songs = filter_by_lambda(songs, criteria[:filter]) if criteria[:filter]
    songs
    # @collection.select { |song| song.matches?(criteria) }
  end

  def filter_by_name(songs, name)
    songs.select { |song| song.name == name }
  end

  def filter_by_artist(songs, artist)
    songs.select { |song| song.artist == artist }
  end

  def filter_by_tags(songs, tags)
    if tags.kind_of?(Array)
      songs.select { |song| song.has_tags?(tags) }
    elsif tags.kind_of?(String)
      songs.select { |song| song.has_tag?(tags) } 
    end
  end

  def filter_by_lambda(songs, filter)
    songs.select(&filter)
  end

end

class Song

  attr_reader :name, :artist, :genre, :subgenre, :tags

  def initialize(more_tags, *song_info)
    @name, @artist, @tags = song_info[0].strip, song_info[1].strip, []

    genre_pair = song_info[2].split(',')
    @genre = genre_pair[0].strip
    @subgenre = genre_pair[1].strip if genre_pair[1]

    @tags = song_info[3].split(',').map(&:strip) unless song_info[3] == nil
    @tags |= genre_pair.map(&:strip).map(&:downcase)
    @tags |= more_tags[artist] if more_tags.has_key? artist
  end

  # def matches?(criteria)
  #   criteria.all? do |type, value|
  #     case type
  #       when :name then name == value
  #       when :artist then artist == value
  #       when :tags then Array(value).all? { |tag| matches_tag?(tag) }
  #       when :filter then value.(self)
  #     end
  #   end
  # end

  # def matches_tag?(tag)
  #   tag.end_with?("!") ^ @tags.include?(tag.chomp("!"))
  # end

  def has_tag?(tag)
    if tag.end_with?('!')
      return false if @tags.include?(tag.chop)
    else
      return false unless @tags.include?(tag)
    end
    return true
  end

  def has_tags?(tag_list)
    tag_list.each { |tag| return false unless has_tag?(tag) }
    return true
  end

end