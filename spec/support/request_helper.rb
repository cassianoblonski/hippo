module RequestHelpers
  def create_logged_in_person(*options)
    person = FactoryBot.create(:person, *options)
    login(person)
    person
  end

  def login(person)
    login_as person, scope: :person
  end
end

RSpec.configure do |config|
  config.include RequestHelpers, type: :feature
end
