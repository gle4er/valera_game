class Event < ApplicationRecord
  def stats
    {
      hp: hp, mp: mp, attack: attack, defense: defense, 
      lucky: lucky, money: money, xp: xp
    }
  end
end
