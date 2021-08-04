require 'rails_helper'

RSpec.describe TeamCompetition do
  it { should belong_to :team}
  it { should belong_to :competition}
end