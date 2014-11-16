use Win32::OLE qw(in with);
use strict;

my $username="Lando Tanghe";
my $pw = "";

my $distinguishedName="CN=Lando Tanghe,OU=EM7INF,OU=Studenten,OU=iii,DC=iii,DC=hogent,DC=be";
my $server="193.190.126.71";

my $ldap=Win32::OLE->GetObject("LDAP:");
my $moniker="LDAP://$server/$distinguishedName";

my $object = $ldap->OpenDSObject($moniker,$username,$pw,1);
print $object->{AdsPath},"\n";
print $object->{EmailAddress},"\n";