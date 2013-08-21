require_relative 'lib/example_template.rb'

template = Template::Example.new "./javascript/donation_page.js" do
  %Q{
    <table>
      <tr>
        <td align="right">Amount:</td>
        <td><input type="text" id="donation_amount"></td>
      </tr>

      <tr>
        <td align="right">First Name:</td>
        <td><input type="text" id="first_name"></td>
      </tr>
      <tr>
        <td align="right">Last Name:</td>
        <td><input type="text" id="last_name"></td>
      </tr>
      <tr>
        <td>Payment Type:</td>
        <td>
          <input type="radio" id="check_payment_method" name="payment_type" value="Check" onclick="selectPaymentType()">Check
            <input type="radio" id="credit_payment_method" name="payment_type" value="Credit" onclick="selectPaymentType()">Credit<br>
        </td>
      </tr>
    </table>

    <div id="check_payment_type" class="hidden">
      Check Number: <input type="text" id="check_number"><br />
    </div>
    <div id="credit_payment_type" class="hidden">
      Card Number: <input type="text" id="card_number"><br />
      CVV: <input type="text" id="cvv_number"><br />
    </div>
    <input type="submit" id="submit" value="Submit" onclick="resetForm()" >
}
end

puts template.generate

