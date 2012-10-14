if Rails.application.railties.all.map(&:railtie_name).include? "spree_social"

  Deface::Override.new(:virtual_path => "spree/users/show",
                       :name => "replace_account_summary_with_social_logins",
                       :replace => "[data-hook='account_summary']",
                       :sequence => {:after => 'replace_account_my_orders'},
                       :text => %q{<% if @user.user_authentications.present? %>
  <h3>Login Saya</h3>
  <table id="cart-detail">
    <thead>
      <tr>
        <th>Penyedia</th>
        <th>Nama Panggilan</th>
        <th>Koneksi</th>
        <th>&nbsp;</th>
      </tr>
    </thead>
    <tbody>
    <% @user.user_authentications.each do |auth| %>
      <tr class="<%= cycle('even', 'odd') %>">
        <td class="normal">
          <%= image_tag "/assets/store/#{auth.provider}_32.png", :size => "32x32" %>
          <%= auth.provider.capitalize %>
        </td>
        <td class="normal"><%= auth.nickname %></td>
        <td class="normal"><%= auth.created_at.to_date%></td>
        <td class="normal"><%= link_to( "Unlink", auth, :confirm => 'Apakah anda yakin untuk menghapus koneksi dari akun ini', :method => :delete, :class => "remove") %></td>
      </tr>
    <% end %>
    </tbody>
  </table>

  <hr />
<% end %>


<h3>Koneksi Akun</h3>
<p>Anda dapat menghubungkan akun PasarCairo dengan akun dari situs:</p>
<% Spree::AuthenticationMethod.where(:environment => ::Rails.env).each do |user| %>
  <%= link_to(image_tag("/assets/store/#{user.provider}_32.png", :size => "32x32", :alt => "#{user.provider}"), "/users/auth/#{user.provider}", :title => "Sign in with #{user.provider}") if user.active %>
<% end %>
  })

end
