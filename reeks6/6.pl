use Win32::OLE qw(in with);
use strict;

my $login="Lando Tanghe";
my $pw="";

my $distinquishedName="CN=SATAN,OU=Domain Controllers,DC=iii,DC=hogent,DC=be";
my $moniker ="LDAP://193.190.126.71/$distinquishedName";

my $ldap = Win32::OLE->GetObject("LDAP:");
my $object = $ldap->OpenDSObject($moniker,$login,$pw,1);

my @propNames =qw (AdsPath Class GUID Name Parent Schema);
for my $prop(@propNames){
	printf "prop %-10s is %-20s\n",$prop,$object->{$prop};
}