use Win32::OLE qw(in with);
use Win32::OLE::Const;
use strict;

my %lib = %{Win32::OLE::Const->Load("Active DS Type Library")};

for my $key(keys %lib){
	printf "%-45s is %-5s\n",$key, $lib{$key};
}
