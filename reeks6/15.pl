use Win32::OLE qw(in with);
use strict;
use Binder;

my $lokaal="";

#dsquery gebruikt om nodige container te zoeken:
# dsquery * -filter "(cn=Frescobaldi)"

my $klasName= "OU=225,OU=PC's,OU=iii,DC=iii,DC=hogent,DC=be";
my $klas=Binder::bind_object($klasName);
for my $computer (sort {$a->{cn} cmp $b->{cn}} in $klas){
	print $computer->{cn},"\n";
}

my $systemName = "CN=System,DC=iii,DC=hogent,DC=be";
my $system = Binder::bind_object($systemName);
for my $systemObject(in $system){
	printf "%-30s: %-20s\n",$systemObject->{class},$systemObject->{cn};
}