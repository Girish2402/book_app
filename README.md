# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Ruby version: 2.4.1
Rails Version: 5.1.4


System dependencies
 - run bundle install


Database creation
 - run rake db:populate

Create token
	Run the following command to create access token

		config = YAML.load_file(File.join(Rails.root, 'config/secrets.yml'))[Rails.env]
		payload = {token: config['auth_token'], expires_at: (Time.now + 24.hour).to_i}
		JWT.encode(payload, config['secret_key_base'])


Deployment instructions
...


