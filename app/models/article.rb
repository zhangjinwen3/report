class Article < ApplicationRecord
    def self.instance_method_already_implemented?(method_name)
        return true if method_name == 'frozen'
        return true if method_name == 'frozen?'
    end
    

    validates :name, presence: true,
                    length: { minimum: 1 }
    validates :time, presence: true,
                    length: { minimum: 1 }
    validates :content, presence: true,
                    length: { minimum: 1 }
    validates :record, presence: true,
                    length: { minimum: 1 }
    validates :issue, presence: true,
                    length: { minimum: 1 }
    validates :task, presence: true,
                    length: { minimum: 1 }
    validates :summart, presence: true,
                    length: { minimum: 1 }
end
