Deface::Override.new(:virtual_path => %q{spree/layouts/spree_application},
                          :name => %q{replace_body},
                          :replace => %q{[data-hook='body']},
                          :closing_selector => %q{},
                          :text => %q{<body id="<%= (@body_id == 'signup' ? 'checkout' : @body_id) || controller.controller_name %>">
    <div id="container">
        <header>
          <%= link_to image_tag("store/logo.png", :width => "300", :height => "58", :alt => "Rails Dog Radio", :id => "logo"), root_url %>
          <form action="#" >
          </form>
          <%= form_tag products_url, :method => :get do %>
            <input type="search" id="s1" class="empty" name="keywords" placeholder="Cari Pasar Cairo">
          <% end %>
          <nav>
            <%= link_to "Produk", products_path %>
            <% if current_user %>
              <%= link_to t('my_account'), account_path, :class => "cart" %>
              <%= link_to t('logout'), destroy_user_session_path, :class => "cart" %>
            <% else %>
              <%= link_to t('log_in'), login_path, :class => "cart" %>
            <% end %>
            <%= link_to_cart "Keranjang" %>
          </nav>
        </header>
<!--    
        <% if content_for?(:banner) %>
          <div id="banner" role="banner">
            <%= yield :banner %>
          </div>
        <% end %>
-->
        
        <div id="main" role="main">
          <% if flash.notice %>
            <div class="flash notice"><%= flash.notice %></div>
          <% end %>
          <% if flash[:error] %>
            <div class="flash errors"><%= flash[:error] %></div>
          <% end %>
        
          <%= yield %>
        </div>
        
        <% if content_for?(:sidebar) %>
	  <br/>
          <div id="sidebar" role="sidebar">
            <%= yield :sidebar %>
          </div>
        <% end %>
        
    </div>
    
    <footer data-hook="footer">
      <div class="inner">
        <%= image_tag "store/kid.jpg", :width => "204", :height => "413", :alt => "RailsDog Radio Kid", :id => "kid" %>
    
        <div id="about-railsdog-radio">
          <div>
           Didatangkan langsung dari <b>Cairo, Mesir</b>. <b>Pasar Cairo</b> menyediakan produk kayu <b>Kauka / Kokka</b> yang didalamnya terdapat berbagai rahasia dan kelebihan sebagai obat, penyembuh dan pelindung. <b>Kayu Kokka</b> telah digunakan sejak zaman Nabi-nabi yang terdahulu seperti bahtera <b>Nabi Nuh AS</b>, tongkat <b>Nabi Musa AS</b>, tongkat <b>Nabi Syuaib AS</b>, tongkat <b>Sayyidina Ali KW<b>.
 <p>
            <p id="more-about-railsdog-radio">
              <a href="/about">Tentang Pasar Cairo ></a>
            </p>
          </div>
        </div>
    
        <div id="contact-us">
          <h3>Hubungi</h3>
          <p>
          (0274)560-2000<br>
          <a href="mailto:sales@pasarcairo.com">sales@pasarcairo.com</a>
          </p>
        </div>
    
        <div id="social">
          <h3>Sosial</h3>
          <p>
          <a href="http://facebook.com/pasarcairo" id="facebook"><span>Facebook</span></a>
          <a href="http://twitter.com/pasarcairo" id="twitter"><span>Twitter</span></a>
          </p>
        </div>
    
        <div id="menu">
          <h3>Menu</h3>
          <p>
          <a href="/about">Profil</a><br />
          <a href="/privacy">Harga</a>
          </p>
        </div>
    
        <p id="copyright">&copy; Copyright <%= Time.zone.now.year %> Pasar Cairo. All rights reserved</p>
    
      </div>
    </footer>
</body>})
