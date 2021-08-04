require 'rails_helper'

RSpec.describe TeamCompetitions do
  it { should belong_to :team}
  it { should belong_to :team_competition}
end