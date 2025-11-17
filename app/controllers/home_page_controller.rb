class HomePageController < ApplicationController
  # Allow unauthenticated access to the home/index pages
  allow_unauthenticated_access only: %i[home index]

  # Render the homepage. Use instance-level `respond_to` so we only respond
  # to formats we explicitly support (avoids class-level `respond_to` issues).
  def index
    respond_to do |format|
      format.html { render :index }
      # If a test or client requests an unsupported format, fall back to HTML
      # to avoid 406 responses in tests that don't set an explicit Accept header.
      format.any  { render :index }
    end
  end

  # Matches the route `get "home_page/home"` used in the test-suite
  def home
    respond_to do |format|
      format.html { render :index }
      format.any  { render :index }
    end
  end
end
