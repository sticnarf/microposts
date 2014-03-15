require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector("h1", text: heading) }
    it { should have_title(full_title(title))}
  end

  describe "Home page" do

    before { visit root_path }

    let(:heading) { 'Microposts' }
    let(:title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('|') }

  end

  describe "Help page" do
    before { visit help_path }

    let(:heading) { 'Help' }
    let(:title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }

    let(:heading) { 'About' }
    let(:title) { 'About' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }

    let(:heading) { 'Contact' }
    let(:title) { 'Contact' }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link 'About'
    expect(page).to have_title('About')
    click_link 'Contact'
    expect(page).to have_title('Contact')
    click_link 'Home'
    expect(page).to have_selector('h1', text: 'Microposts')
    click_link 'Sign up'
    expect(page).to have_title('Sign up')
    click_link 'Help'
    expect(page).to have_title('Help')
    click_link 'Microposts'
    expect(page).to have_selector('h1', text: 'Microposts')
  end
end
