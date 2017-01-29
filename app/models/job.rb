class Job < ApplicationRecord
    validates :title, presence: true
    validates :wage_upper_bound, presence: true
    validates :wage_lower_bound, presence: true
    validates :wage_lower_bound, numericality: { greater_than: 0 }

    scope :published, -> { where(is_hidden: false) }
    scope :recent, -> { order('created_at DESC') }

    has_many :resumes

    def publish!
        self.is_hidden = false
        save
    end

    def hide!
        self.is_hidden = true
        save
    end

    def self.search(search)
        where('title LIKE ?', "%#{search}%").or(where('description LIKE ?', "%#{search}%"))
    end

    # def search
    #     if @query_string.present?
    #         search_result = Job.ransack(@search_criteria).result(distinct: true)
    #         @jobs = search_result.paginate(page: params[:page], per_page: 20)
    #         set_page_title "职位搜索 #{@query_string}"
    #     end
    # end
end
