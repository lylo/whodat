class WhoController < ApplicationController
  include Authorization

  def index
  end

  def play
    @person = unless params[:recent].present?
        puts "all people"
        Person.all.with_attached_avatar.sample
      else
        puts "recent people only"
        Person.where("trello_created_at > ?", 1.year.ago).with_attached_avatar.sample
      end
    names = @person.name.split(" ")
    @masked_name = names.map {|name| name.gsub(/\B[\w]/, "*") }.join(" ")
  end
end
