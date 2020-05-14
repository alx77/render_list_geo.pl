# render_list_geo.pl
Perl script for automatic rendering OSM tiles for renderd+mod_tile with using geographic coordinates (WGS-84)

### Usage:
```perl
./render_list_geo.pl -n <n> -s <s> -t <t> -z <z> -Z <Z> -x <x> -X <X> -y <y> -Y <Y>
```
```
where:
<n> - number of concurrent threads
<l> - maximum load
<m> - render tiles from this map
<s> - socket for renderd
<t> - tiles location
<z> - render tiles from this zoom level
<Z> - render tiles to this zoom level
<x> - render tiles from this longitude
<X> - render tiles to this longitude
<y> - render tiles from this latitude
<Y> - render tiles to this latitude
```

### Samples
```bash
#Ukraine
./render_list_geo.pl -n 2 -m map_name -z 6 -Z 15 -x 21.8 -X 40.7 -y 44.03 -Y 52.6
#Belgium (using three threads)
./render_list_geo.pl -n 3 -z 6 -Z 16 -x 2.5 -X 6.5 -y 49.4 -Y 51.6
#The Netherlands
./render_list_geo.pl -n 2 -m default -x 3.275104 -X 7.103310 -y 50.758069 -Y 53.662826 -z 15 -Z 18
#Belgium (using 25 threads and a maximum load of 40)
./render_list_geo.pl -n 25 -l 40 -z 6 -Z 16 -x 2.5 -X 6.5 -y 49.4 -Y 51.6
#Czech Republic 44 threads with specified socket and tile location
perl ./render_list_geo.pl -m ajt -s /var/run/renderd/renderd.sock -t /var/lib/mod_tile/ajt -n 44 -z 6 -Z 6 -x 48.543905 -X 51.074211 -y 12.068158 -Y 18.912640

```
