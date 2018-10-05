# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :directory_indexes
activate :dato
activate :pagination

configure :development do
  activate :livereload
end


dato.tap do |dato|
  paginate dato.articles, "", "/templates/index.html", per_page: 5

  dato.articles.each do |article|
    proxy "/articles/#{article.slug}/index.html", "/templates/article.html", locals: { article: article }
  end
end

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


configure :build do
  activate :minify_html
  activate :minify_css
  activate :minify_javascript
end





