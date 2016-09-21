class User < ActiveRecord::Base
  has_secure_password

  # AWS Craziness
  has_attached_file :photo,
  					         styles: { medium: "300x300#", thumb: "100x100#" },
					           default_url: "/images/missing.png",
                     :storage => :s3,
                     url: ":s3_domain_url",
                     path: "/:class/:attachment/:id_partition/:style/:filename",
                     s3_region: 'us-west-1',
                     :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    {
      :bucket => ENV["S3_BUCKET_NAME"],
      :access_key_id => ENV["S3_ACCESS_KEY_ID"],
      :secret_access_key => ENV["S3_SECRET_ACCESS_KEY"]
    }
  end

  # makes sure that the only type of file being uploaded is an image:
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/


  has_many :opinions
  has_many :votes

# method to return sum total off all that user's opinions
  def cred
    cred = 0
    self.opinions.each do |o|
        cred += (o.votes.where({sentiment: true}).count - o.votes.where({sentiment: false}).count)
      end
      cred
  end

end
