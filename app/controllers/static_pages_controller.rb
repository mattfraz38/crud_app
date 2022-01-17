class StaticPagesController < ApplicationController
  def index
  end

  def about
    @now = Time.now
    @birthday = Time.new(1988, 3, 3)
    @age = @now.year - @birthday.year - ((@now.month > @birthday.month || (@now.month == @birthday.month && @now.day >= @birthday.day)) ? 0 : 1)
  end
end