class Bourbon < ActiveRecord::Base
  has_attached_file :image, 
  styles: { medium: "300x300>", thumb: "100x100>" }, 
  default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :name, exclusion: { in: %w(new) }
  validates :slug, exclusion: { in: %w(new) }
  after_create :generate_slug
  before_update :assign_slug

  def to_param
    slug
  end

  private

  def assign_slug
    self.slug = to_slug
  end

  def generate_slug
    update_attributes(slug: to_slug)
  end

  def to_slug
    name.parameterize
  end
end
