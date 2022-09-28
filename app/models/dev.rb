class Dev < ActiveRecord::Base
    has_many :freebies 
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.any? do |freebie|
            freebie.item_name == item_name
        end
    end

    def give_away(dev, freebie)
        if (self.id == freebie.dev_id)
            freebie.update(dev_id: dev.id)
        else 
            "This isn't your freebie!"
        end
    end
end
