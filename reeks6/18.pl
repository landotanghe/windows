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
	@containers = ($containers[$choice]);
}
for my $containername (@containers){
	my $container = Binder::bind_object($containername);
	my $klassen_counter ={}; #ANONIEME HASH MOET BLIJKBAAR EERST GEINITIALISEERD WORDEN
	overloopObjecten($container,$klassen_counter);
	print scalar keys %{$klassen_counter}," verschillende klassen:\n\n";
	for my $key(sort {  ${$klassen_counter}{$b} <=> ${$klassen_counter}{$a} } keys %{$klassen_counter}){
		print "$key counted ${$klassen_counter}{$key} times\n";
	}
}



sub overloopObjecten{
	my $container=shift;
	my $klassen_counter=shift;#pointer naar hash (key=klasse,value=count)
	for my $component(in $container){
		my $naam = $component->{Class};
		${$klassen_counter}{$naam}++;
		#print $naam,"\n";
		if( $component->{Class} eq "container"){
			overloopObjecten($component,$klassen_counter);
		}
	}
}