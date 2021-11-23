class WhoController < ApplicationController
  include Authorization

  def index
  end

  def play
    @person = unless params[:recent].present?
        Person.all.with_attached_avatar.sample
      else
        Person.where("trello_created_at > ?", 1.year.ago).with_attached_avatar.sample
      end
    names = @person.name.split(" ")
    @masked_name = names.map {|name| name.gsub(/\B[\w]/, "*") }.join(" ")
  end
end
