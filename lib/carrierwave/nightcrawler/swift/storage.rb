module Carrierwave
  module Nightcrawler
    module Swift
      class Storage < CarrierWave::Storage::Abstract
        def initialize(uploader)
          super(uploader)

          @swift_list = NightcrawlerSwift::List.new
          @swift_upload = NightcrawlerSwift::Upload.new
        end

        def store!(file)
          @swift_upload.execute @uploader.filename, ::File.new(file.file)
        end

        def retrieve!(identifier)
          list = @swift_list.execute(prefix: identifier)
          SwiftFile.new(list[0]) if (list.is_a?(Array) && (list.count > 0))
        end

        class SwiftFile
          def initialize(attrs)
            @attrs = attrs
          end

          def path
            @attrs["name"]
          end

          def url(options = {})
            "#{NightcrawlerSwift.connection.public_url}/#{NightcrawlerSwift.options.bucket}/#{@attrs["name"]}"
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
