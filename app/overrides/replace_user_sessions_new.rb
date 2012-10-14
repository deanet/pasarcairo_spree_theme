Deface::Override.new(:virtual_path => %q{spree/user_sessions/new},
                          :name => %q{replace_user_sessions_new},
                          :replace => %q{#existing-customer},
                          :text => %q{
<% if Rails.application.railties.all.map(&:railtie_name).include? "spree_social" %>
<%= render 'spree/shared/social_users' %>
<% end %>
<div id="local_login">

  <div id="existing-customer">
    <h2>Pelanggan PasarCairo</h2>
    <p>Jika anda sudah terdaftar di PasarCairo anda dapat login di sini:</p>
    <%= render :partial => 'spree/shared/login' %>
  </div>

  <hr/>

  <div id="new_customers">
    <h2>Pelanggan Baru</h2>
    <p>Anda dapat mendaftarkan akun baru di PasarCairo dengan mengisi form berikut:</p>
    <%= form_for :user, :url => spree.user_registration_path(@user) do |f| %>

        <% if session[:omniauth] %>
          <p>
            <%= f.label :email, t("email") %>
            <%= f.text_field :email, :class => 'title'  %>
          </p>
        <% else %>
          <%= render 'spree/shared/user_form', :f => f %>
        <% end %>
        <p>
          <button type="submit">Daftar</button>
        </p>
      <% end %>


  </div>
</div>
})
