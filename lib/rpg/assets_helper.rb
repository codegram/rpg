module Rpg
  module AssetsHelper
    def path_of(res)
      p "File.expand_path File.join(File.dirname(__FILE__), '..', '..', 'resources', res)"
      p File.expand_path File.join(File.dirname(__FILE__), '..', '..', 'resources', res)
      File.expand_path File.join(File.dirname(__FILE__), '..', '..', 'resources', res)
    end
  end
end
