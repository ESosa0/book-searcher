class BookApiClient

def self.get_list_names
    url = "http://api.nytimes.com/svc/books/v3/lists/overview.json?&api-key=66173255f070c8345fb890d3b2b63ba5:12:74940926"
    response = RestClient.get(url)
    response = JSON.parse(response)
    lists = response["results"]["lists"]
    lists.each do |list|
      List.create name: list["list_name"], name_encoded: list["list_name_encoded"]
    end
  end

end
