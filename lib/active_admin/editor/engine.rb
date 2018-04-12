module ActiveAdmin
  module Editor
    class Engine < ::Rails::Engine
      engine_name 'active_admin_editor'

      ActiveAdmin.application.class_eval do
        def editor; ActiveAdmin::Editor.configuration end
      end

      initializer 'active_admin.editor', :group => :all do |app|
        app.config.assets.precompile += [
          'active_admin/editor.js',
          'active_admin/editor.css'
        ] + ActiveAdmin::Editor.configuration.stylesheets

        # removed due to:
        # DEPRECATION WARNING: Active Admin: The `register_stylesheet` config is deprecated and will be removed
        # in v2. Import your "active_admin/editor.css" stylesheet in the active_admin.scss.

        # ActiveAdmin.application.tap do |config|
        #   config.register_javascript 'active_admin/editor.js'
        #   config.register_stylesheet 'active_admin/editor.css'

        #   ActiveAdmin::Editor.configuration.stylesheets.each do |stylesheet|
        #     config.register_stylesheet stylesheet
        #   end
        # end
      end
    end
  end
end
