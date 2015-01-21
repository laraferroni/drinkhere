class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable,  :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :user_achievements
  has_many :user_list_items
  has_many :master_list_items, through: :user_list_items


  has_many :roles

	rails_admin do 
    list do
    	field :full_name
      field :email
      field :created_at
    end
  end

  before_save :set_fullname


  
  def is_admin
    if self.roles.first.nil?
      return false
    else
       return self.roles.first.super_admin
    end
  end

  def is_approver
    if self.roles.first.nil?
      return false
    else
       return self.roles.first.list_manager
    end
  end

  def set_fullname
  	fn = []
    fn << self.try(:first_name)
    fn << self.try(:last_name)
  	self.full_name = fn.compact.join(" ")
  end


  def achievements

    a = Achievement.all

    a_level = []
    a.each do |achievement|
      tc = 0
      achievement.tasks.each do |task|
        completed = UserListItem.where("user_id = ? AND master_list_id = ?", self.id, task.master_list_id)
        if completed.size >= task.total_items_needed
          tc += 1
        end
      end
      logger.debug(achievement.tasks.size)
      logger.debug(tc)
      if tc == achievement.tasks.size
        a_level << achievement
      end
    end
    return a_level
  end


  def working_on(achievement_id)
      self.user_achievements.where("achievement_id = ?", achievement_id).first
      
  end

  def prereqs_complete(achievement_id)
    achievement = Achievement.find(achievement_id)
    if !achievement.prereq.nil?

      ua = self.user_achievements.where("achievement_id = ?", achievement.prereq_id).first

      
      return (ua.present? && ua.completed)
    else
      return true
    end
  end

  def required_status(task_id)
    if task_id.present?
      task = Task.find(task_id)
      requireds =task.required_list_ids
      completeds = UserListItem.where("user_id = ? AND master_list_id = ?", self.id, task.master_list_id).pluck(:master_list_item_id)
      done = requireds & completeds
      return done
    end
  end

end
