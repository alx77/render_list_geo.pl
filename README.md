# render_list_geo.pl
Perl script for automatic rendering OSM tiles for renderd+mod_tile with using geographic coordinates (WGS-84)
###Usage:
```perl
./render_list_geo.pl -n <n> -z <z> -Z <Z> -x <x> -X <X> -y <y> -Y <Y>
```
```
where:
<n> - number of concurrent threads
<z> - render tiles from this zoom level
<Z> - render tiles to this zoom level
<x> - render tiles from this longitude
<X> - render tiles to this longitude
<y> - render tiles from this latitude
<Y> - render tiles to this latitude
```
###sample
```perl
#for Ukraine
./render_list_geo.pl -n 2 -z 6 -Z 15 -x 21.8 -X 40.7 -y 44.03 -Y 52.6
```
