class WhoController < ApplicationController
  include Authorization

  def index
  end

  def play
    scope = unless params[:recent].present?
        Person.with_attached_avatar.all
      else
        Person.where("trello_created_at > ?", 1.year.ago)
      end

    @person = scope.with_attached_avatar.select {|p| p.avatar.attached?}.sample

    names = @person.name.split(" ")
    @masked_name = names.map {|name| name.gsub(/\B[\w]/, "*") }.join(" ")
  end
end
