class HumanPlayer
    attr_reader :marker
  
    def initialize(marker = 'X')
      @marker = marker
    end
  
    def assign_marker_as(new_marker)
      marker = new_marker
    end
  
  end