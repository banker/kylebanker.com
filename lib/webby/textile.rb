Webby::Filters.register :textile do |input|
  r = RedCloth.new(input, [:no_span_caps])
  r.hard_breaks = false
  r.to_html
end
