class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        freebies.map{ |freebie| freebie.item_name }.includes?(item_name)

        #freebies.extis? item_name: item_name
    end

    def give_away(dev, freebie)
        freebie.dev == self ? freebie.update( dev: dev) : "Not yours"
    end
end
