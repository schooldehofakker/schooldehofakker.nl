xml.instruct!
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.title 'Feed title'
    xml.description 'Feed description'
    xml.link root_url
    xml.language 'en'
    xml.tag! 'atom:link', rel: 'self', type: 'application/rss+xml', href: nieuws_url

    @allnews.each do |n|
      xml.item do
        xml.title n.titel
        xml.pubDate(n.published.rfc2822)
        xml.link nieuw_url(n.slug)
        xml.guid nieuw_url(n.slug)
        xml.description(h(@renderer.render(n.content).html_safe))
      end
    end
  end
end
