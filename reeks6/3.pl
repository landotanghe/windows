use Win32::OLE;
use strict;

my $ipadres="192.168.16.16";
my $distinquishedName="CN=BELIAL,OU=Domain Controllers,DC=iii,DC=hogent,DC=be";
my $moniker = "LDAP://$ipadres/$distinquishedName";
my $object = Win32::OLE->GetObject($moniker);

print $object->{AdsPath},"\n";

my $ldap = Win32::OLE->GetObject("LDAP:");
my $object2 = $ldap->openDSObject($moniker,"Lando Tanghe","Lando Tanghe",1);
print $object2->{AdsPath},"\n";