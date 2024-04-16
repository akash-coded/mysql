This directory contains the files for setting up the airportdb sample 
database on a MySQL DB System on Oracle Cloud Infrastructure (OCI).

Unpacking the airport-db.zip or airport-db.tar.gz archive results 
an airport-db directory with the following files:

README.txt 
airportdb@airline@@0.tsv.zst
airportdb@airline@@0.tsv.zst.idx
airportdb@airline.json
airportdb@airline.sql
airportdb@airplane@@0.tsv.zst
airportdb@airplane@@0.tsv.zst.idx
airportdb@airplane.json
airportdb@airplane.sql
airportdb@airplane_type@@0.tsv.zst
airportdb@airplane_type@@0.tsv.zst.idx
airportdb@airplane_type.json
airportdb@airplane_type.sql
airportdb@airport@@0.tsv.zst
airportdb@airport@@0.tsv.zst.idx
airportdb@airport_geo@@0.tsv.zst
airportdb@airport_geo@@0.tsv.zst.idx
airportdb@airport_geo.json
airportdb@airport_geo.sql
airportdb@airport.json
airportdb@airport_reachable.json
airportdb@airport_reachable.sql
airportdb@airport_reachable.tsv.zst
airportdb@airport_reachable.tsv.zst.idx
airportdb@airport.sql
airportdb@booking@0.tsv.zst
airportdb@booking@0.tsv.zst.idx
airportdb@booking@10.tsv.zst
airportdb@booking@10.tsv.zst.idx
airportdb@booking@11.tsv.zst
airportdb@booking@11.tsv.zst.idx
airportdb@booking@12.tsv.zst
airportdb@booking@12.tsv.zst.idx
airportdb@booking@13.tsv.zst
airportdb@booking@13.tsv.zst.idx
airportdb@booking@14.tsv.zst
airportdb@booking@14.tsv.zst.idx
airportdb@booking@15.tsv.zst
airportdb@booking@15.tsv.zst.idx
airportdb@booking@16.tsv.zst
airportdb@booking@16.tsv.zst.idx
airportdb@booking@17.tsv.zst
airportdb@booking@17.tsv.zst.idx
airportdb@booking@18.tsv.zst
airportdb@booking@18.tsv.zst.idx
airportdb@booking@19.tsv.zst
airportdb@booking@19.tsv.zst.idx
airportdb@booking@1.tsv.zst
airportdb@booking@1.tsv.zst.idx
airportdb@booking@20.tsv.zst
airportdb@booking@20.tsv.zst.idx
airportdb@booking@21.tsv.zst
airportdb@booking@21.tsv.zst.idx
airportdb@booking@22.tsv.zst
airportdb@booking@22.tsv.zst.idx
airportdb@booking@23.tsv.zst
airportdb@booking@23.tsv.zst.idx
airportdb@booking@@24.tsv.zst
airportdb@booking@@24.tsv.zst.idx
airportdb@booking@2.tsv.zst
airportdb@booking@2.tsv.zst.idx
airportdb@booking@3.tsv.zst
airportdb@booking@3.tsv.zst.idx
airportdb@booking@4.tsv.zst
airportdb@booking@4.tsv.zst.idx
airportdb@booking@5.tsv.zst
airportdb@booking@5.tsv.zst.idx
airportdb@booking@6.tsv.zst
airportdb@booking@6.tsv.zst.idx
airportdb@booking@7.tsv.zst
airportdb@booking@7.tsv.zst.idx
airportdb@booking@8.tsv.zst
airportdb@booking@8.tsv.zst.idx
airportdb@booking@9.tsv.zst
airportdb@booking@9.tsv.zst.idx
airportdb@booking.json
airportdb@booking.sql
airportdb@employee@@0.tsv.zst
airportdb@employee@@0.tsv.zst.idx
airportdb@employee.json
airportdb@employee.sql
airportdb@flight@@0.tsv.zst
airportdb@flight@@0.tsv.zst.idx
airportdb@flight.json
airportdb@flight_log.json
airportdb@flight_log.sql
airportdb@flight_log.tsv.zst
airportdb@flight_log.tsv.zst.idx
airportdb@flightschedule@@0.tsv.zst
airportdb@flightschedule@@0.tsv.zst.idx
airportdb@flightschedule.json
airportdb@flightschedule.sql
airportdb@flight.sql
airportdb.json
airportdb@passenger@@0.tsv.zst
airportdb@passenger@@0.tsv.zst.idx
airportdb@passengerdetails@@0.tsv.zst
airportdb@passengerdetails@@0.tsv.zst.idx
airportdb@passengerdetails.json
airportdb@passengerdetails.sql
airportdb@passenger.json
airportdb@passenger.sql
airportdb.sql
airportdb@weatherdata@0.tsv.zst
airportdb@weatherdata@0.tsv.zst.idx
airportdb@weatherdata@@1.tsv.zst
airportdb@weatherdata@@1.tsv.zst.idx
airportdb@weatherdata.json
airportdb@weatherdata.sql
@.done.json
@.json
@.manifest.json
@.post.sql
@.sql

You can install airportdb on a MySQL DB System from an Object Storage
bucket or from a Compute instance.

From an Object Storage bucket:

Download an airportdb archive file and unpack it locally.

Upload the airportdb files to an Object Storage bucket.
 
Load airportdb on the MySQL DB System using the MySQL Shell Dump Loading 
Utility. On the Compute instance that you use to connect to the DB System, 
start MySQL Shell and run the following command:

MySQL>JS> util.loadDump("airportdb", {threads: 16, deferTableIndexes: "all", 
          osBucketName: "<bucket-name>", osNamespace: "<namespace>", 
          ignoreVersion: true})
          
From a Compute instance:

Download an airportdb archive file to the Compute instance and unpack it.

Load airportdb on the MySQL DB System using the MySQL Shell Dump Loading 
Utility. On the Compute instance that you use to connect to the DB System, 
start MySQL Shell and run the following command:

MySQL>JS> util.loadDump("airport-db", {threads: 16, deferTableIndexes: "all", 
          ignoreVersion: true})

Optionally, after the airportdb sample database is created on the MySQL DB System,  
load the tables into HeatWave by executing the following Auto Parallel Load command.

MySQL>JS> \sql
MySQL>SQL> CALL sys.heatwave_load(JSON_ARRAY('airportdb'), NULL);

  


     

