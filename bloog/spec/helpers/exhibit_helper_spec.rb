require_relative '../spec_helper_lite'
stub_class 'BaseExhibit'
require_relative '../../app/helpers/exhibit_helper'

describe ExhibitHelper do
  before do
    @it = Object.new
    @it.extend ExhibitHelper
    @context = stub!
  end

  it "delegates exhibition decisions to Exhibit" do
    model = Object.new
    mock(::BaseExhibit).exhibit(model, @context)
    @it.exhibit(model, @context)
  end
end
