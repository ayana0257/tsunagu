class Party < ApplicationRecord
	has_many :favorites
	has_many :users, through: :favorites
	has_many :attend_parties
	has_many :users, through: :attend_parties
	has_many :clips
	has_many :users, through: :clips
	belongs_to :user, optional: true

	def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Party.where(['place LIKE ?', "%#{search}%"])
    else
      Party.all #全て表示。
    end
    end
 	# attr_protected :id
 	# scope :search_names_or, lambda { |search_word| where("date = ? or place = ?", search_word, search_word) }



end
