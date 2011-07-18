class Review < APISmith::Smash

  property :rating, :transformer => :to_i
  property :created_at
  property :text
  property :user

end
