# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Ruby version: 2.4.1
Rails Version: 5.1.4


System dependencies
 - run bundle install


Database creation
 - run rake db:seed

Run the following command to create access token

	config = YAML.load_file(File.join(Rails.root, 'config/secrets.yml'))[Rails.env]
	payload = {token: config['auth_token'], expires_at: (Time.now + 24.hour).to_i}
	JWT.encode(payload, config['secret_key_base'])

hit below web api end point using any REST api client

	http://localhost:3000/api/v1/book?search=The%20Daffodil%20Sky&auth_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbiI6IjZiZjUyMjQzLTRkMmQtNGIxZC1hNmJkLWY3ODM1ZGVkMDhkNiIsImV4cGlyZXNfYXQiOjE1MzQ0MjQxNDd9.2SyXqkC2UssxU3kA2geJjBUvr76sfDBBOGK3LV6RPa8

Deployment instructions
...


