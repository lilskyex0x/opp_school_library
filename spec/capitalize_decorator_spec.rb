require './capitalize_decorator'
require './person'

describe CapitalizeDecorator do
    context "Create an instance of capitalize and test functionality"

    it "should capitalize the first name" do
        person = Person.new(33, "tshepo")
        capitalize_person = CapitalizeDecorator.new(person).correct_name
        expect(capitalize_person).to eq "Tshepo"
    end
end