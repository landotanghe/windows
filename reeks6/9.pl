use Win32::OLE;
use strict;
binmode(STDOUT,":utf8");
use Binder;

my $object_naam = "CN=Lando Tanghe,OU=EM7INF,OU=Studenten,OU=iii,DC=iii,DC=hogent,DC=be";
my $object = Binder::bind_object($object_naam);

printAttribute($object,"mail");
printAttribute($object,"givenName");
printAttribute($object,"sn");
printAttribute($object,"displayName");
printAttribute($object,"homeDirectory");
printAttribute($object,"scriptPath");
printAttribute($object,"profilePath");
printAttribute($object,"logonHours");
printAttribute($object,"userWorkstations");


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