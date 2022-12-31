Link = Struct.new :title, :url
Product = Struct.new :name, :cover, :platform, :release, :text, :quote, :links

def products 
  [
    Product.new(
      'eny',
      'eny.png',
      'iOS',
      'Coming soon',
      'parts/eny-text',
      'parts/eny-quote',
      []
    ),
    Product.new(
      'Dots',
      'dots.png',
      'iOS',
      'Released in 2022',
      'parts/dots-text',
      'parts/dots-quote',
      [
        Link.new('AppStore', 'https://apps.apple.com/app/id6443408878')
      ]
    )
  ]
end
