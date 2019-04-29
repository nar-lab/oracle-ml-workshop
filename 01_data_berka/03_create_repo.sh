#!/bin/bash

echo exit | sqlplus SYS/welcome1@ORCL AS SYSDBA  @dataminer/scripts/installodmr.sql ZIRAAT_TS TEMP
echo exit | sqlplus SYS/welcome1@ORCL AS SYSDBA  @dataminer/scripts/usergrants.sql ZIRAAT
