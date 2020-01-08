describe file '/usr/local/bin/kalihud' do
  it { should be_file }
  it { should be_executable }
end

describe command 'kalihud' do
  its('exit_status') { should eq 0 }
  its('stdout') { should match /8888888888888ND88.*Services:.*Metasploit.*DNSmasq/ }
  its('stdout') { should match /N88888888888888888.*BeEF/ }
  its('stdout') { should match /D888888888888.*Faraday/ }
  its('stdout') { should match /N888888888OD.*Docker/ }
  its('stdout') { should match /N888888888N.*SSH/ }
  its('stdout') { should match /N88888888O8N.*Kismet/ }
  its('stdout') { should match /8888888888888DD.*Apache2/ }
  its('stdout') { should match /D8888888888888.*PgSQL/ }
  its('stdout') { should match /8888888888D.*DHCPD/ }
  its('stdout') { should match /D888888.*Hostapd/ }
end
