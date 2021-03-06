class Artifact < ActiveRecord::Base
  class Accessors
    class << self
      def init(context, *accessors)
        accessors.each do |accessor|
          attr_ids = "#{accessor}_ids"
          
          context.class_eval do
            define_method "#{accessor}_list=" do |v|      # def skill_list=(v)
              mapping = (v || '').split(',').map do |str|
                artifact = Artifact.where(kind: Artifact.kinds[accessor]).
                  where(name: str.strip.mb_chars.downcase).
                  first_or_initialize
                artifact.save! if artifact.new_record?
                artifact.id
              end
              
              write_attribute(attr_ids, mapping)
            end
            
            define_method "#{accessor}_list" do
              Artifact.where(id: read_attribute(attr_ids)).pluck(:name)
            end
          end
        end
      end
    end
  end
  
  enum kind: [:skill, :role, :service]
  
  validates :kind, presence: true
  validates :name, presence: true, uniqueness: {scope: :kind}
  
  scope :skills,   -> { where(kind: kinds[:skill]) }
  scope :roles,    -> { where(kind: kinds[:role]) }
  scope :services, -> { where(kind: kinds[:service]) }
end
