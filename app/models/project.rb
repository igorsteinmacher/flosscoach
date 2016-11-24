class Project < ActiveRecord::Base
  belongs_to :languages
  belongs_to :operating_systems
  belongs_to :tools
  has_many :widgets
  has_many :favoriter_projects
  has_many :fans, through: :favoriter_projects, :source => :user
  has_and_belongs_to_many :owners, class_name: 'User'
  has_attached_file :image_project, styles:
    { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :image_project, content_type:
    { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  has_many :favorite_projects
  has_many :favorited_by, through: :favorite_projects, source: :user

  def self.search(search)
    if search
      Project.where('name LIKE ?', "%#{search}%")
    else
      Project.all
    end
  end

end
