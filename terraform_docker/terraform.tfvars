# ext_port = [1880] #, 1881, 1882]
# in order to create external port for each env. # we will use the map mathod
#int_port = 1880   
ext_port = {
   nodered = {
    dev = [1980]
    prod = [1880]
    }
   influxdb = {
    dev = [8081]
    prod = [8086]
   }
   grafana = {
    dev = [3100]
    prod = [3000]
   }
}