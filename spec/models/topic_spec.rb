require 'rails_helper'

describe Topic do
  it { should belong_to(:user) }
  it { should have_many(:responses) }
end
