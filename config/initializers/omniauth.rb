# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :google_oauth2,
#   ENV["GOOGLE_CLIENT_ID"],
#   ENV["GOOGLE_SECRET_ID"],
#     {
#       callback_path: '/auth/google_oauth2/callback'
#     }
# end

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET_ID'], {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
