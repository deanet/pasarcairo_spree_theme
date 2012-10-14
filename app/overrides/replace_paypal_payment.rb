Deface::Override.new(:virtual_path => 'spree/checkout/payment/_paypalexpress',
                     :name => 'replace_paypal_payment',
                     :replace => 'a',
                     :text => %q{<li class="payment_method <%= payment_method.id %>" style="display:<%= checked == payment_method.id ? "block" : "none" %>;">
  <h2>Informasi Paypal Anda</h2>
  <p>Anda akan dirujuk ke website PayPal saat anda menekan tombol lanjut berikut</p>
</li>}) 

