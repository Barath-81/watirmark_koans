module PageHelpers
  def show_page name
    goto file_path(name)
  end

  def browser
    @@browser ||= begin
      Watirmark::Session.instance.openbrowser
      Watirmark::Page.browser.goto file_path('koans.html')
      $koan_browser = Watirmark::Page.browser
      Watirmark::Page.browser
    end
    Watirmark::Page.browser = @@browser.frame(:id, 'example')
  end


  private

  def goto(path)
    browser
    $koan_browser.execute_script "parent.document.getElementById('example').src = \"#{path}\""
  end

  def file_path(name)
    "file://" + File.dirname(__FILE__) + "/../html/#{name}"
  end

  def document &block
    begin
      browser.execute_script "return window.frames[0].document.getElementById('test_case_documentation').innerHTML='#{block.call}'"
    rescue Selenium::WebDriver::Error::JavascriptError
      browser.execute_script "return document.getElementById('test_case_documentation').innerHTML='#{block.call}'"
    end
  end
end