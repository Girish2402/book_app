begin

  avatar_url = Faker::Avatar.image("my_profile_image", "250x250", "jpg")
  genre_names = ['Science fiction','Satire','Drama','Action and Adventure','Romance','Mystery','Horror','Self help','Fantasy']

  # 100.times do -- this will take 10 mins to get all records from faker
  100.times.each_with_index do |index|
    @author = Author.create(
      name:         Faker::Name.name,
      bio:          Faker::Lorem.paragraph(50),
      academics:    Faker::Educator.course,
      awards:       Faker::Educator.university,
      avatar:       open(avatar_url)
    )

    puts " Successfully Created Author #{@author.name} records #{index+=1} ".center(71, '*')

    # 100(author) * 5(books) = 5000(total books)
    5.times do
      random_genres = genre_names.shuffle.sample(rand(1..9))
      @book = @author.books.create(
          name:           Faker::Book.title,
          short_desc:     Faker::Lorem.sentence(10),
          long_desc:      Faker::Lorem.sentence(40),
          chapter_index:  Faker::Lorem.sentence(60),
          publish_date:   Faker::Date.backward(14),
          genres:         random_genres
        )

      puts " Successfully Created Book #{@book.name} ".center(71, '*')

      5.times do
        @review = @book.reviews.create(
          reviewer:   Faker::Name.name,
          rating:     rand(0..5),
          title:      Faker::Lorem.sentence(3),
          desc:       Faker::Lorem.sentence(10)
        )
        puts " Successfully Created Reviewer #{@review.reviewer} ".center(71, '*')
      end unless Review.count.eql?(250)
    end
  end
  puts ''.center(100, '=')
  puts ''.center(100, '=')
  puts " Author count: #{Author.count} ".center(71, '=')
  puts " Book count: #{Book.count} ".center(71, '=')
  puts " Review count: #{Review.count} ".center(71, '=')
rescue Exception => error
  puts "Exception handled: #{error}".center(71, '-')
end