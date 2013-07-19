require 'spec_helper'

describe AdminController do

  describe "GET 'hub'" do
    it "returns http success" do
      get 'hub'
      response.should be_success
    end
  end

end
