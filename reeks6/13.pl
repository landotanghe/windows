use Binder;

# implementatie bind_object functie: zie sectie 5
my $RootObj = Binder::bind_object("RootDSE");

printf "%-10s : %s\n", $_ , $RootObj->{$_} foreach qw (Name Class GUID ADSPath Parent Schema dnsHostName defaultNamingContext); 
#De ADSI-attributen Class en Schema zijn niet ingevuld omdat RootDSE niet overeenkomt met een AD object
#verwissel defaultNamingContext dnsHostName om alle uitvoer te zien.

#In PowerShell heb je daar geen last van...


#Als je de waarde ophaalt van de zes ADSI-attributen van de IADs interface, dan zijn ze niet allemaal ingesteld. Verklaar waarom
# waarschijnlijk omdat class en schema te maken hebben met schema en RootDSE niet in schema opgenomen is,want
# is niet echt.