import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
mail_content = '''Hello,<br>
PFA<br>
With Regards,<br>
QA Department
'''
#The mail addresses and password
sender_address = 'aasha.achhami@extensodata.com'
sender_pass = 'Ashaac12'
#receiver_address[] = ['bina.acharya@extensodata.com','sony.shrestha@extensodata.com']
#Setup the MIME
message = MIMEMultipart()
message['From'] = sender_address
message['To'] = "aasha.achhami@extensodata.com"
   # "bina.acharya@extensodata.com,susma.pant@extensodata.com,suresh.gautam@extensodata.com"
message['Subject'] = 'Test Case execution Report'
#The subject line
#The body and the attachments for the mail
message.attach(MIMEText(mail_content, 'html'))
attach_files = ['report.html', 'log.html']
for attach_file_name in attach_files:
    attach_files= open(attach_file_name, 'rb')  # Open the file as binary mode
    payload = MIMEBase('application', 'octet-stream')
    payload.set_payload((attach_files).read())
    encoders.encode_base64(payload)  # encode the attachment
    # add payload header with filename
    # The subject line
    # The body and the attachments for the mail
    payload.add_header('Content-Disposition', 'attachment;filename = %s  ' % attach_file_name)
    message.attach(payload)
    session = smtplib.SMTP('smtp.office365.com', 587) #use gmail with port
    session.starttls() #enable security
    session.login(sender_address, sender_pass)
    #login with mail_id and password
    text = message.as_string()
session.sendmail(message['From'], message['To'].split(",") , text)
session.quit()
print('Mail Sent')
