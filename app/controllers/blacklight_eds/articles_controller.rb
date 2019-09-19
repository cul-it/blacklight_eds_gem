require 'ebsco-discovery-service-api'
require_dependency "blacklight_eds/application_controller"

class BlacklightEds::ArticlesController < BlacklightEds::ApplicationController
  # include Blacklight::Marc::Catalog
  include Blacklight::Catalog
  include BlacklightEds::Articles
  include Blacklight::Catalog::SearchContext

  helper_method :search_action_url
  helper_method :path_for_eds_article

  before_filter :current_search_session, only: [:all, :index]

  # to override any method in this class, create a new module, and include it in the extended controller class
  def add_show_tools_partial(name, opts = {})
    opts[:partial] ||= 'document_action'
    add_action(show.document_actions, name, opts)
    klass && ActionBuilder.new(klass, name, opts).build
  end

end
