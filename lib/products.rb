Product = Struct.new :name, :cover, :platform, :release, :text, :quote

def products
  [
    Product.new('eny', 'eny.png', 'iOS', 'Coming late 2022', 'parts/eny-text', 'parts/eny-quote'),
    Product.new('Dots', 'dots.png', 'iOS', 'Coming Soon', 'parts/dots-text', 'parts/dots-quote'),
  ]
end
