use Win32::OLE qw(in with);
use Win32::OLE::Const;

my $default="_UF_";
(my $pattern) = (@ARGV,$default);

my $constants = Win32::OLE::Const->Load("Active DS Type Library");

for my $key (keys %{$constants}){
	if($key =~ $pattern){
		printf "%-20s is %-20s\n", $key ,${$constants}{$key};
	}
}
