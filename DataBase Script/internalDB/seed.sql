-- seed data for obstype
insert into obstype(obstype_id, display_name) values (1, 'Observation');
insert into obstype(obstype_id, display_name) values (2, 'Body Site');
insert into obstype(obstype_id, display_name) values (3, 'Method');
insert into obstype(obstype_id, display_name) values (4, 'Body Position');

-- seed data for obscategory
insert into obscategory(obscategory_id, display_name, code) values (1,'Vital Signs', 'vital-signs');
