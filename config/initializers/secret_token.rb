# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '1c2daf1a607a7662ee22ee4378c003ddaa913e8b407b10d35d8a10e28aff34edb92038a193de862f82a9d2e1b77b792521672e584d0742904c227d284e8a6c40'
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#Use existing token
		File.read(token_file).chomp
	else
		# Generate a new token, store it in token_file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleApp::Application.config.secret_key_base = secure_token