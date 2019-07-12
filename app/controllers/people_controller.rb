class PeopleController < ApplicationController
  before_action :authenticate_person!

  def show
    @person = Person.find(params[:id])
  end
end
