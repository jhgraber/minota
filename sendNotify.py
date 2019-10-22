import smtplib
import subprocess as sp


## Get global environment variables
## setting  from this project runID main config file 
def loadEnv(config_file):
    project_env={}
    output=sp.Popen("source "+config_file+";env",shell=True, stdout=sp.PIPE, stderr=sp.STDOUT).stdout.read()
    for line in output.splitlines():
        # Skip lines with comments
        if line.startswith("#"):continue
        if "=" in line:
            try:
                key,value=line.split("=")
                project_env[key]=value
            except:pass
    return project_env

def send_mail(sender,receiver,message):
    try:
        smtpObj = smtplib.SMTP('localhost')
        smtpObj.sendmail(sender, receiver, message)
        print ("Successfully sent email to %s"%(receiver))
    except:
        print ("Error: unable to send email to %s"%(receiver))

if __name__== "__main__":

    first_name="Lucie"
    user_name="lucieh"
    sender="lucie.hutchins@mdibl.org"
    receiver="lucie.hutchins@yahoo.com"
    receiver="lucie.hutchins@mdibl.org"
    message = """From: LucieHut<lucie.hutchins@mdibl.org>
    To: Lucie <lucie.hutchins@yahoo.com>
    MIME-Version: 1.0
    Content-type: text/html
    Subject: MDIBL Transcriptome Workshop - October 26
    """
    """
    body="<p>Dear "+first_name+",</p>"
    body+="<p>We have you listed as one of the attendees for MDIBL transcriptome workshop - </p>"
    body+="<p><b>Date and Time:</b>October 26, 2019 - From 8:00am to 4:00pm"
    body+="<br/><b>Address:</b>159 Old Bar Harbor Rd, Bar Harbor, ME 04609</p>"
    body+="<p>In this workshop, attendees will learn how to build and work with non-model organism transcriptome.</p>"
    body+="<p>Here are few things to keep in mind:"
    body+="<ul><li>We will use Amazon Web Services(AWS) Linux instances(EC2) and virtual desktops(WorkSpace) to run the workshop</li>"
    body+="<li><b>Your User name for the workshop:</b>"+user_name+"</li>"
    body+="<li>You will be assigned either an AWS EC2 instance OR an AWS workSpace - Or both (depending on your preference) </li>"
    body+="<li>You will use your labtop to connect to AWS resources</li>"
    body+="<li>Your email will be used to cr</li>"
    body+="<li>Connections to AWS resources will be provided during the workshop</li></ul></p>"
    body+="<p>We are looking forward to seeing you on Saturday, Oct 26, for this workshop</p>"
    signature="<p><hr/></p>"
    signature+="<p>Lucie Hutchins<br/>Senior Software Engineer<br/></p>"
    #message=message+body+signature
    """
    try:
        smtpObj = smtplib.SMTP('localhost')
        smtpObj.sendmail(sender, receiver, message)
        print ("Successfully sent email to %s"%(receiver))
    except:
        print ("Error: unable to send email to %s"%(receiver))
    #send_mail(sender,receiver,message)
    
    

