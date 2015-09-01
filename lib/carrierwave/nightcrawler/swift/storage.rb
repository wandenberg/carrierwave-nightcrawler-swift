module Carrierwave
  module Nightcrawler
    module Swift
      class Storage < CarrierWave::Storage::Abstract
        def initialize(uploader)
          super(uploader)
        end

        def store!(file)
          upload = NightcrawlerSwift::Upload.new
          upload.execute @uploader.filename, ::File.new(file.file)
        end

        def retrieve!(identifier)
          SwiftFile.new({"name" => identifier})
        end

        class SwiftFile
          def initialize(attrs)
            @attrs = attrs
          end

          def path
            @attrs["name"]
          end

          def url(options = {})
            "#{NightcrawlerSwift.connection.public_url}/#{NightcrawlerSwift.options.bucket}/#{path}"
          end

          def delete
            delete = NightcrawlerSwift::Delete.new
            delete.execute path
          end
        end
      end
    end
  end
end
