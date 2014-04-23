class IdsPlease
  class Facebook < IdsPlease::BaseParser

    MASK = /fb\.me|fb\.com|facebook/i

    def self.parse_link(link)
      query = CGI.parse(link.query) if link.query && !link.query.empty?

      if query && query['id']
        query['id'].first
      elsif link.path =~ /\/pages\//
        link.path.split('/').last
      else
        link.path.split('/')[1]
      end
    end

  end
end
