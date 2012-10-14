Deface::Override.new(:virtual_path => %q{spree/products/show},
                          :name => %q{replace_cart_form},
                          :replace => %q{[data-hook='cart_form']},
                          :closing_selector => %q{},
                          :text => %q{<div id="cart-form" data-hook="cart_form">
    <%= form_for :order, :url => populate_orders_url do |f| %>
    
        <%= hidden_field_tag (@product.has_variants? ? :quantity : "variants[#{@product.master.id}]"), 1, :class => "title", :size => 3 %>
    
        <dl class="part-numbers clearfix">
          <dt>Nomor Produk</dt>
          <dd><%= @product.sku %></dd>
        </dl>
        <dl class="prices clearfix">
          <dt>Harga</dt>
          <dd><span class="price discounted"><%= number_to_currency @product.cost_price %></span></dd>
          <dt>Harga Diskon</dt>
          <dd><span class="price selling"><%= number_to_currency @product.price %></span></dd>
          <!-- #Coming soon
            <dt>after $xx.00 rebate</dt>
            <dd><span class="price">$xx.99</span></dd>
          -->
        </dl>
        <dl class="shipping">
          <dt>Ongkir</dt>
          <dd><span class="price">GRATIS</span></dd>
        </dl>
        <dl class="stock">
          <dt>Stok</dt>
          <dd><span class="stock"><%= @product.has_stock? ? "YA" : "TIDAK" %></span></dd>
        </dl>
        <hr />
    
    
      <hr />
    
      <p><button type="submit">Tambahkan ke Keranjang</button></p>
    <% end %>

</div>},
                          :disabled => true)

