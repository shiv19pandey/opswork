require 'net/smtp'

message = <<MESSAGE_END
From: ubuntu@localhost
To: kamalk@limeroad.com
Subject: SMTP e-mail test
This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('localhost') do |smtp|
  smtp.send_message message, 'kamalk@limeroad.com',
                             'kamalk@limeroad.com'
end
