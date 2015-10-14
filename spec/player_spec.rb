require './lib/player.rb'

describe Player do
  before :each do
    @ada = Player.new("Ada")
  end

  describe "#new" do
    it "create a new instance of Player" do
      expect(@ada).to be_an_instance_of Player
    end

    it "assigns the input name to the @name variable" do
      expect(@ada.name).to eq "Ada"
    end
  end

  describe "#name" do
    it "returns the name assigned to the player" do
      expect(@ada.name).to eq "Ada"
    end
  end

  describe "#plays" do
    it "returns an array of words played"do
    @ada.play("dog")
    @ada.play("cat")
    @ada.play("falcon")
    expect(@ada.plays).to eq @ada.player_words
    end
  end

  describe "#play" do
    before :each do
      @ada = Player.new("Ada")
      @total_score = 0
    end

    it "pushes the guessed word onto array of guessed words" do
    @ada.play("dog")
    @ada.play("cat")
    @ada.play("falcon")
    expect(@ada.player_words).to eq ["dog", "cat", "falcon"]
    end

    # it "if the player has won, returns false" do
    #   @ada.play("zqzqzqzqzqzq")
    #   expect(@ada.play("dog")).to eq false
    # end
  end

  describe "#total_score" do
    it "sums up and returns the score of player words" do
      @ada.play("dog")
      @ada.play("cat")
      @ada.play("falcon")
      expect(@ada.total_score).to eq 21
    end
  end

  describe "#won?" do
    it "if the player has over 100 points returns true" do
      @ada.play("zqzqzqzqzqzq")
      expect(@ada.won?).to eq true
    end
  end


end
