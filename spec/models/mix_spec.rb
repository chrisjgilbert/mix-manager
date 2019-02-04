require 'rails_helper'

RSpec.describe Mix do

  subject { described_class.new(id: 1, title: 'My mix', description: 'an awesome mix', url: 'www.mix.com') }

  it "is valid with valud attributes" do
    expect(subject).to be_valid
  end

end
