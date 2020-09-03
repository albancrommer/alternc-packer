# Configure these parameters according to your needs

# Do you want to see verbose information during installation?
DEBUG=1
# Do you want to simulate all operations to test the process?
DRY_RUN=0
# Do you want to run in strict mode where any error causes exit?
STRICT=0
# Do you want to run in silent mode and not get any questions asked?
SILENT=1
# Do you want to use nightly packets - for developers only -
NIGHTLY=0

## if SILENT is equal to 1, you MUST set these variables

# string 
# rfc5737 IP address
ALTERNC_PUBLIC_IP="203.0.113.12"
# 0/1 
VAR_USE_ALTERNC_SUBDOMAIN="example.net"
# string 
ALTERNC_DESKTOPNAME="example.net"
# 0/1 
VAR_USE_ALTERNC_NS="1"
# string 
ALTERNC_NS1="%ALTERNC_NS1%"
# string 
ALTERNC_NS2="%ALTERNC_NS2%"
# 0/1 
INSTALL_ROUNDCUBE="0"
# 0/1
INSTALL_MAILMAN="°"

