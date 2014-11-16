use Win32::OLE qw(in with);
use strict;

# distinquishedNames:
my $Satan  =	"CN=SATAN,OU=Domain Controllers,DC=iii,DC=hogent,DC=be";
my $Belial =	"CN=BELIAL,OU=Domain Controllers,DC=iii,DC=hogent,DC=be";

my $monikerSchool =	"LDAP://Satan.iii.hogent.be/$Satan";	
my $monikerThuis  = "LDAP://Satan.hogent.be/$Satan";

my $ldap = Win32::OLE->GetObject("LDAP:");

my $object = $ldap->OpenDSObject("$monikerThuis","Lando Tanghe","",1);
print "objecttype:\t",ref $object,"\nerror:\t\t",Win32::OLE->LastError();