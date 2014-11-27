use Win32::OLE qw(in with);
use Win32::OLE::Const "Active DS";
use Binder;

my $group = Binder::bind_object("CN=Users,DC=iii,DC=hogent,DC=be");
$group->{filter}=["user"];
for my $user (in $group){
	print $user->{FullName},"\n";
}
