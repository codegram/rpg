module Rpg
  module AssetsHelper
    def path_of(res)
      File.expand_path File.join(File.dirname(__FILE__), '..', '..', 'resources', res)
    end
  end
end
