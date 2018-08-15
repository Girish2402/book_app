begin
  # clear database
  avatar_url = Faker::Avatar.image("my_profile_image", "250x250", "jpg")
  genre_names = ['Science fiction','Satire','Drama','Action and Adventure','Romance','Mystery','Horror','Self help','Fantasy']

  # 100.times do -- this will take 10 mins to get all records from faker
  100.times do
    @author = Author.new(
        name:         Faker::Name.name,
        bio:          Faker::Lorem.paragraph(50),
        academics:    Faker::Educator.course,
        awards:       Faker::Educator.university,
        avatar:       open(avatar_url)
      )

    # 100(author) * 5(books) = 5000(total books)
    5.times do
      random_genres = genre_names.shuffle.sample(rand(1..9))
      @book = Book.new(
          name:           Faker::Book.title,
          short_desc:     Faker::Lorem.sentence(10),
          long_desc:      Faker::Lorem.sentence(40),
          chapter_index:  Faker::Lorem.sentence(60),
          publish_date:   Faker::Date.backward(14),
          genres:         random_genres
        )
      @book.author = @author
      @book.save!
      # 500(books) * 25(reviews) = 25000(total reviews)
    end
  end
  250.times do
    book = Book.find(Book.pluck(:id).shuffle.first)
    @review = Review.new(
      reviewer:   Faker::Name.name,
      rating:     rand(0..5),
      title:      Faker::Lorem.sentence(3),
      desc:       Faker::Lorem.sentence(10)
    )
    book.reviews << @review
  end
  puts "------------------------------------------------------------------"
  puts "Author count: #{Author.count}"
  puts "Book count: #{Book.count}"
  puts "Review count: #{Review.count}"
rescue Exception => e
  puts "Exception handled: #{error}"
end