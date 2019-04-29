create directory loader_dir as '/home/oracle/workshop/03_json_datasets';
grant read,write on directory loader_dir to odmuser;
create directory loader_tmp as '/tmp';
grant read,write on directory loader_tmp to odmuser;


drop table json_dump_file_contents ;
create table json_dump_file_contents (json_doc clob)
  organization external(
      type oracle_loader default directory loader_dir
      access parameters
        ( records delimited by 0x'0A'
          disable_directory_link_check
          badfile loader_tmp:'JsonDumpFile.bad'
          logfile loader_dir: 'JsonDumpFile.log'
        )
      location (loader_dir:'stocks.json')
      )
    parallel
    reject limit unlimited;
