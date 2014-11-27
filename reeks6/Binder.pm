use Win32::OLE;
use strict;
package Binder;
sub bind_object{
	my $param = shift; #distinguished name of de volledige moniker

	#parameter in juiste variabele zetten (afh. van type)
	my $distinquishedName;
	my $moniker;
	if($param=~"LDAP://"){
		$moniker=$param;
	}else{
		$distinquishedName=$param;
	}

	#logingegevens:
	my $login ="Lando Tanghe";
	my $pass = "Lando Tanghe";
	my $domain= $ENV{"USERDNSDOMAIN"} || "***";

	#object ophalen afhankelijk van intern of extern
	if($domain eq "III.HOGENT.BE"){
		#lokaal
		my $ipadres="192.168.16.16";
		$moniker = $moniker || "LDAP://$ipadres/$distinquishedName";
		return Win32::OLE->GetObject($moniker);
	}else{
		#extern
		my $ipadres="193.190.126.71";
		$moniker = $moniker || "LDAP://$ipadres/$distinquishedName";
		my $ldap= Win32::OLE->GetObject("LDAP:");
		return $ldap->OpenDSObject($moniker,$login,$pass,1);
	}
}

1;