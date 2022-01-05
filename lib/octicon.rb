require 'octicons'

def octicon(symbol, options = {})
  icon = Octicons::Octicon.new(symbol, options)
  icon.to_svg
end
