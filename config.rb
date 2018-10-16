require 'redcarpet'

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :directory_indexes
activate :dato
activate :pagination

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_html
  activate :minify_css
end

helpers do
  def markdownify(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(text)
  end
end

ignore '/templates/*'

dato.tap do |dato|
  paginate dato.articles, "", "/templates/index.html", per_page: 20

  dato.articles.each do |article|
    proxy "/articles/#{article.slug}/index.html", "/templates/article.html", locals: { article: article }
  end
end
