require 'ebsco-discovery-service-api'
require_dependency "blacklight_eds/application_controller"

class BlacklightEds::ArticlesController < BlacklightEds::ApplicationController
  include Blacklight::Marc::Catalog
  include Blacklight::Catalog
  include BlacklightEds::Articles
  include Blacklight::Catalog::SearchContext

  helper_method :search_action_url
  helper_method :path_for_eds_article

  before_filter :current_search_session, only: [:all, :index]

  # to override any method in this class, create a new module, and include it in the extended controller class

  # Add a partial to the tools for rendering a document
  # @!macro partial_if_unless
  # @option opts [Boolean] :define_method define a controller method as named, default: true
  # @option opts [Symbol]  :validator method for toggling between success and failure, should return Boolean (true if valid)
  # @option opts [Symbol]  :callback method for further processing of documents, receives Array of documents
  def add_show_tools_partial(name, opts = {})
    blacklight_config.add_show_tools_partial(name, opts)
    ActionBuilder.new(self, name, opts).build
  end

end
