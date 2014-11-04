json.array!(@books) do |book|
  json.extract! book, :id, :control, :author, :title, :loans
  json.url book_url(book, format: :json)
end
