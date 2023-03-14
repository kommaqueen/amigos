json.markers @markers
json.results render(partial: 'pages/search_results', locals: { places: @places, events: @events}, formats: :html)
