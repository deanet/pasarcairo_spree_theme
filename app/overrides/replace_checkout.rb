Deface::Override.new(:virtual_path => %q{spree/checkout/edit},
                          :name => %q{replace_checkout},
                          :replace => %q{#checkout[data-hook]},
                          :closing_selector => %q{},
                          :text => %q{<div id="checkout" role="checkout" class="clearfix">
  <div id="title" role="title">Akhiri Belanja</div>
  <!-- START MAIN CONTENT -->
  <div id="main-content" role="main-content">
    <%= render "spree/shared/error_messages", :target => @order %>
    <div id="tabs" role="tabs">
      <ul>
        <li><span class="number">1</span><span class="title">Buat Akun</span></li>
        <li <%= @order.address?  && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">2</span><span class="title">Alamat Anda</span></li>
        <li <%= @order.delivery?  && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">3</span><span class="title">Pengiriman</span></li>
        <li <%= @order.payment?  && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">4</span><span class="title">Pembayaran</span></li>
        <li <%= @order.confirm? && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">5</span><span class="title">Alamat Pesanan</span></li>
      </ul>
    </div>
    <%= form_for @order, :url => update_checkout_path(@order.state), :html => { :id => "checkout_form_#{@order.state}" } do |form| %>
      <%= render @order.state, :form => form %>
    <% end %>
  </div>
  <!-- END MAIN CONTENT -->
  <%= render 'summary' %>
</div>})
