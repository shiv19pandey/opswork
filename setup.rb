script "setup" do 
  interpreter "bash"
  user "ubuntu"
  group "ubuntu"
  Chef::Log.level = :debug
# pulling before putting crontab so that any changes can be taken care of
 mode = node[:mode]
 service = node[:service]
  code1 = ''
  code1 +=  "
  if [ $(dpkg-query -W -f='${Status}' filebeat 2>/dev/null | grep -c \"ok installed\") -eq 0 ];
  then
  curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.3.0-amd64.deb;
  sudo dpkg -i filebeat-5.3.0-amd64.deb;
  sudo service filebeat start;
  fi
  "
   puts code1
   system(code1)
end
