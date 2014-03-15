require 'spec_helper'

describe ApplicationHelper do

  describe "full title" do
    it "should include the page title" do
      expect(full_title("Foo")).to match /Foo/
    end

    it "should include the base title" do
      expect(full_title("Foo")).to match /^#{base_title}/
    end

    it "should not include a bar separator for the home page" do
      expect(full_title).not_to match /\|/
    end
  end

end