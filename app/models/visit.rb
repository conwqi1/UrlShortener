class Visit
  
  def self.record_visit!(user, shortened_url)
    Visit.create!(submitter_id: user.id, long_url: long_url, short_url: short_url)
  end
end