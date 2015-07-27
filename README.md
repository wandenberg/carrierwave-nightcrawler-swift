# Carrierwave Nightcrawler Swift

This gem is a [Carrierwave](https://github.com/jnicklas/carrierwave/) store for Swift. This library uses [nightcrawler_swift](https://github.com/tulios/nightcrawler_swift) for swift operations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'carrierwave-nightcrawler-swift'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave-nightcrawler-swift

## Usage

You should configure the client.

```
NightcrawlerSwift.configure({
  :bucket=>"container-name",
  :tenant_name=>"tenant-name",
  :username=>"user",
  :password=>"some-secret-password",
  :auth_url=>"https://your-swift-server.com/v2.0/tokens",
  :verify_ssl=>false
})
```

Set the storage to be __storage Carrierwave::Nightcrawler::Swift::Storage__. .

``` ruby
class AvatarUploader < CarrierWave::Uploader::Base
  :storage => Carrierwave::Nightcrawler::Swift::Storage
end
```
