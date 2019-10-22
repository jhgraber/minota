import smtplib

from email.message import EmailMessage
from email.headerregistry import Address
from email.utils import make_msgid

# Create the base text message.
msg = EmailMessage()
msg['Subject'] = "MDIBL Transcriptome Workshop"
msg['From'] = Address("Lucie Hutchins", "lucie.hutchins", "mdibl.org")
msg['To'] = (Address("Lucie Bobcat", "lucie.hutchins", "yahoo.com"))
msg.set_content("""\
Hi Lucie,

------------------
Lucie Hutchins
Senior Engineer
MDIBL Bioinformatics Core
Ext: 142

""")

# Add the html version.  This converts the message into a multipart/alternative
# container, with the original text message as the first part and the new html
# message as the second part.
asparagus_cid = make_msgid()
msg.add_alternative("""\
<html>
  <head></head>
  <body>
    <p>Hi Lucie,</p>
    <p>
     
    </p>
  </body>
</html>
""".format(subtype='html')

# Make a local copy of what we are going to send.
with open('outgoing.msg', 'wb') as f:
    f.write(bytes(msg))

# Send the message via local SMTP server.
with smtplib.SMTP('localhost') as s:
    s.send_message(msg)
