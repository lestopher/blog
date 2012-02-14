class User < ActiveRecord::Base
  has_many :posts
  has_secure_password
  validates_presence_of :fname, :lname, :username, :password, :on => :create
  validates_uniqueness_of :username
  
   before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  private
    
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(submitted_password)
    end
    
    def encrypt(string)
      secure_hash('#{salt}--#{string}')
    end
    
    def make_salt
      secure_hash('#{Time.now.utc}--#{password}')
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
end