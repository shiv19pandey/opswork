script "awsssm" do 
  interpreter "bash"
  user "ubuntu"
  group "ubuntu"
  Chef::Log.level = :debug
# pulling before putting crontab so that any changes can be taken care of
 mode = node[:mode]
 service = node[:service]
  code1 = ''
  code1 +=  "
  if [ $(dpkg-query -W -f='${Status}' amazon-ssm-agent 2>/dev/null | grep -c \"ok installed\") -eq 0 ];
  then
  cd /tmp
  curl -L -O https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb;
  sudo dpkg -i amazon-ssm-agent.deb;
  sudo start amazon-ssm-agent;
  fi
  "
   puts code1
   system(code1)
end
