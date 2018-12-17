class Item < ApplicationRecord
    has_and_belongs_to_many :valeras

    def stats
      {
        hp: hp, mp: mp, attack: attack, 
        defense: defense, lucky: lucky
      }
    end

end
