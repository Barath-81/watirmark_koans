require_relative "doc_helpers"

module AboutPageObjectsDocHelper
  include DocHelpers
  extend self

  def page_object_view
    ruby %Q{
class ContactPage < Watirmark::Page
  keyword(:first_name) { browser.text_field(:id => "first_name") }
  keyword(:last_name)  { browser.text_field(:id => "last_name")  }
end}
  end

  def test_about_page_objects
    document "Page Objects" do
      %Q{
         <p>Page Objects describe a design pattern that provides an interface
            between a UI interface and a class.

         <p>We use it because it allows us to refer to any UI element with a keyword and
            use that keyword in the rest of our test infrastructure. If the UI changes,
            we update it in exactly one place, the Page Object.

         <p>For this example, we define the Page as follows:
            #{page_object_view}
      }
    end
  end

  def test_about_page_object_keywords
    document "Page Objects", "Keywords" do
      %Q{
         #{page_object_view}

         <p>For our page object, we've defined two keywords. One for :first_name
            and one for :last_name. When the class is instantiated, it automatically creates
            a getter and setter method for each keyword.

         <p>So we could then get the value of the text field using

      }
    end
  end

end

