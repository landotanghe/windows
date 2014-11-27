#info zie
#Directory service / Directories / Active Directory schema / RootDSE

use Win32::OLE qw(in with);
use strict;
use Binder;

my $rootDSE = Binder::bind_object("RootDSE");
$rootDSE->{DnsHostName}; 

print $rootDSE->{defaultNamingContext},"\n";
print $rootDSE->{configurationNamingContext},"\n";
print $rootDSE->{schemaNamingContext},"\n";