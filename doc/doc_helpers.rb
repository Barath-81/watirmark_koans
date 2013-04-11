module DocHelpers

  def document method, h1=nil, h2=nil, &block
    define_method method do
      if h1
        html = "<h1>#{h1}</h1>\n<hr>"
        if h2
          html += "<h2>#{h2}</h2>\n"
        end
      else
        html = ""
      end
      html += block.call.strip
      html.gsub!("\n", "\\n \\ ") # multiline escape for javascript
      html.gsub!("'", "\\\\'")    # escape apostrophes in the html
      request = "parent.window.frames[0].document.getElementById('test_case_documentation').innerHTML = '#{html}'"
      $koan_browser.execute_script request
    end
  end

  def ruby code
    %Q{<pre class="ruby">

#{code.strip}
</pre>}
  end

end