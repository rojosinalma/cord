module Web
  class Base < Sinatra::Base
    register Sinatra::Namespace
    helpers  Web::Helpers

    def self.inherited(subclass)
      super
      ::Router.use subclass
    end

    configure :production, :development do
      enable :logging
      set    :public_folder, 'app/web/public'
      set    :views,         'app/web/views'
      set    :erb,           escape_html: true, layout_options: { views: 'app/web/views/layouts' }
    end

    # Root route
    get '/' do
      "Hello"
    end

    not_found do
      erb :not_found
    end
  end
end
