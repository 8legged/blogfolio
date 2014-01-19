require "test_helper"

feature "Check for Zurb framework" do
  scenario "framework is present on page" do

    # Given a posts page is returned
    visit posts_path

    # When
    # Then posts should have a the correct selector and declaration block
    page.must_have_css('div[class="off-canvas-wrap"]')
    # page.find(:xpath, '//body').all(:xpath, './/script[@src = "foundation.min.js"]')
  end
end
