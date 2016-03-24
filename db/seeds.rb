User.create(username: "Jon", email: "jon@gmail.com", password: "pw")
User.create(username: "Jim", email: "jim@gmail.com", password: "pw")

Tweet.create(content: "This is a tweet", poster_id: 1)
Tweet.create(content: "Another tweet", poster_id: 1)
Tweet.create(content: "Hey there!", poster_id: 2)
Tweet.create(content: "Hello world!", poster_id: 2)
