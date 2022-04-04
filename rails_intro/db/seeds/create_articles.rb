articles = [
  {
    title: "Seed title 1", 
    body: "Seed body 1",
    article_arts_attributes: [
      {
        name: "Seed name 1",
        likes: 100,
        article_art_comments_attributes: [
          {
            body: "Seed comment 1"
          }
        ]
      }
    ]
  },
  { 
    title: "Seed title 2", 
    body: "Seed body 2",
    article_arts_attributes: [
      {
        name: "Seed name 2",
        likes: 200,
        article_art_comments_attributes: [
          {
            body: "Seed comment 2"
          }
        ]
      }
    ]
  }
]

articles.each do |article|
  Article.create(article)
end