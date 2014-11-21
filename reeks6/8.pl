use Win32::OLE;
use strict;
use Binder;
binmode(STDOUT,":utf8");
my $distinquishedName="CN=BELIAL,OU=Domain Controllers,DC=iii,DC=hogent,DC=be";
my $object =Binder::bind_object($distinquishedName);

print "ADSI-attributen:\n";
printAttribute($object,"GUID");
printAttribute($object,"ADsPath");
printAttribute($object,"class");


print "\nLDAP-attributen:\n";
printAttribute($object,"objectGUID",1);
printAttribute($object,"distinguishedName");
printAttribute($object,"objectClass");


sub getAttributeValue{
	my $object=shift;
	my $attName=shift;
	my $isBitString=shift;

	my $value=$object->{$attName};
	if(ref $value){
		$value = join(", ",@{$value});
	}elsif($isBitString){
		$value = sprintf("%*v02X ","", $value);
	}
	return $value;
}

sub printAttribute{
	my $object=shift;
	my $attName=shift;
	my $isBitString=shift;

	printf "%-30s:%-15s\n", $attName, getAttributeValue($object,$attName,$isBitString);
}