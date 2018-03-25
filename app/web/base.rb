module Web
  class Base < Sinatra::Base
    configure :production, :development do
      enable :logging
      set    :public_folder, 'app/web/public'
      set    :views,         'app/web/views'
      set    :erb, escape_html: true,
                   layout_options: {views: 'app/views/layouts'}
    end

    use Web::Hooks
    use Web::Dashboard

    get '/' do
      "Hello"
    end

    not_found do
      erb :not_found
    end
  end
end
