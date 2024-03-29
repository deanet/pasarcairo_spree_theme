 Deface::Override.new(:virtual_path => %q{spree/user_registrations/new},
                          :name => %q{replace_user_registration_new},
                          :replace => %q{#new-customer},
                          :text => %q{<div id="new_customers">
    <h2>Pelanggan Baru</h2>
    <p>Anda dapat mendaftarkan akun baru di bawah ini:</p>
    <%= form_for :user, :url => spree.user_registration_path(@user) do |f| %>      
        <%= render :partial => 'spree/shared/user_form', :locals => { :f => f } %>
        <p><%= f.submit t(:create), :class => 'button primary' %></p>
    <% end %>
  </div>})
