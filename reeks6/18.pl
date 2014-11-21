use Win32::OLE qw(in with);
use strict;
use Binder;

my $choice=1;

my $rootDSE = Binder::bind_object("rootDSE");
$rootDSE->{DnsHostName}; #om de PropertyCache te initialiseren - zie later

my @containers =  (
					$rootDSE->{defaultNamingContext},
					$rootDSE->{configurationNamingContext},
					$rootDSE->{schemaNamingContext}	
				 );

if($choice){
	my $container = Binder::bind_object($containers[$choice]);
}else{
	for my $containername (@containers){

	}
}


sub overloopObjecten{
	my $container=shift;

}