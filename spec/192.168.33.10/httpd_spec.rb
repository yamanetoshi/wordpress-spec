require 'spec_helper'

describe 'apache2' do
  it { should be_installed }
  it { should be_enabled   }
  it { should be_running   }
end

describe 'port 80' do
  it { should be_listening }
end

describe '/etc/apache2/httpd.conf' do
  it { should be_file }
end

describe '/var/www/wordpress' do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
end

describe '/var/www/wordpress/wp-config.php' do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end

describe '/etc/apache2/sites-enabled/000-default' do
  it { should_not be_file }	 				
end

describe '/etc/apache2/sites-available/wordpress.conf' do
  it { should be_file }
  it { should contain "ServerName precise32" }
end

describe '/etc/apache2/sites-enabled/wordpress.conf' do
  it { should be_file }
  it { should contain "ServerName precise32" }
end
