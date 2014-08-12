class Bourbon < ActiveRecord::Base
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
