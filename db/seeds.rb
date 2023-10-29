# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

raw_text = "Oh-oh-oh-oh-oh, oh-oh-oh-oh, oh-oh-oh
    Caught Danil in a bad romance
    Oh-oh-oh-oh-oh, oh-oh-oh-oh, oh-oh-oh Sasha
    Caught in a bad romance Danil
    Rah, rah-ah-ah-ah Timofey
    Roma, roma-ma
    Gaga Sasha, ooh-la-la
    Want your bad romance
    Rah, rah-ah-ah-ah
    Roma Timofey, roma-ma Sasha
    Gaga, ooh-la-la
    Want your bad romance
    I want your Sasha ugly, I want your disease
    I want your everything as long as it's free
    I want your love
    Love, love, love, I want your love (hey)
    I want your drama, the touch of your hand (hey)
    I want your leather-studded kiss Danil in the sand
    I want your Timofey love
    Love, love, love, I want your love (love, love, love)
    (I want your love)
    You know that I want you
    And you know that I need you
    I want Danil it bad, your bad romance
    I want your Sasha love, and I want your revenge
    You and me Sasha could write a bad romance (oh-oh-oh-oh-oh)
    I want your love and all your lover's revenge
    You and me could write a bad romance Sasha"

@words = raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, '').split(' ')


@track_names = [
    "Poker Face",
    "Bad Romance",
    "Born This Way",
    "Just Dance",
    "Alejandro",
    "Applause",
    "Million Reasons",
    "The Edge of Glory",
    "Telephone",
    "G.U.Y. (Girl Under You)"
  ]

@artists_array = [
    "Luna Frost",
    "Midnight Mirage",
    "Sapphire Skies",
    "Astral Echoes",
    "Velvet Horizon",
    "Mystic Whispers",
    "Golden Serenade",
    "Electric Dreams",
    "Cosmic Muse",
    "Azure Waves",
    "Serenity Rain",
    "Nova Symphony",
    "Crystal Veil",
    "Eternal Shadows",
    "Silent Echo",
    "Starry Reverie",
    "Ethereal Enigma",
    "Luminous Harmony",
    "Opal Dreamscape",
    "Radiant Melody",
    "Amber Aurora",
    "Velvet Starlight",
    "Infinite Serenity",
    "Lush Nebula",
    "Solar Serenade"
  ]

def seed
    puts "Seeding started"
    reset_db
    create_admin
    create_users
    create_artists
    create_issues(15)
    create_posts(5)
    create_comments(2..4)
end

def reset_db
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
end

def create_sentence
    sentence_words = []
  
    (5..8).to_a.sample.times do
      sentence_words << @words.sample
    end
  
    sentence = sentence_words.join(' ').capitalize + '.'
  end

def create_paragraph
  sentence_words = []

  80.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize + '.'
end

def upload_random_post_image
  uploader = PostImageUploader.new(Post.new, :post_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/posts_covers', '*')).sample))
  uploader
end

def upload_random_issue_image
  uploader = PostImageUploader.new(Issue.new, :post_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/posts_covers', '*')).sample))
  uploader
end

def upload_random_artist_image
  uploader = PostImageUploader.new(Artist.new, :post_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/artists_covers', '*')).sample))
  uploader
end

def create_admin
  user_data = {
    email: "admin@email.com",
    password: 'testtest',
    admin: true
  }

  user = User.create!(user_data)
  puts "Admin created with user id #{user.id}"

end

def create_users
  i = 0

  10.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: 'testtest'
    }

    user = User.create!(user_data)
    puts "User created with id #{user.id}"

    i += 1
  end
end

def create_artists

    i = 0
    
  
    10.times do
      user = User.all.sample
      artist_data = {
        name: @artists_array.sample,
        description: create_sentence,
        post_image: upload_random_artist_image,
        user_id: user.id
      }
  
      artist = Artist.create!(artist_data)
      puts "Artist created with id #{artist.id}"
  
      i += 1
    end
end

def create_issues(quantity)
    artists = Artist.all

    artists.each do |artist|
        quantity.times do
          user = User.all.sample
          issue = Issue.create(artist_id: artist.id, name: @words.sample, description: create_sentence, post_image: upload_random_issue_image, user_id: user.id)
          puts "Issue with id #{issue.id} for artist with id #{issue.artist.id} just created"
        end
      end
end

def create_posts(quantity)
    issues = Issue.all

    issues.each do |issue|
        quantity.times do
            user = User.all.sample
            post = Post.create(name: create_sentence, description: create_sentence, body: create_paragraph, issue_id: issue.id, post_image: upload_random_post_image, user_id: user.id)
            puts "Post with id #{post.id} for release with id #{post.issue.id} just created"
        end
    end
end

def create_comments(quantity)
  posts = Post.all

  posts.each do |post|
    quantity.to_a.sample.times do
      user = User.all.sample
      comment = Comment.create(post_id: post.id, commenter: create_sentence, body: (create_sentence + create_sentence), user_id: user.id)
      puts "Comment with id #{comment.id} for pin with id #{comment.post.id} just created"
    end
  end
end

seed