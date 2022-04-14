select create_db_user('orga', 'password');
select create_db_user('orgb', 'password');
select create_db_user('orgc', 'password');
select create_db_user('org_group_a', 'password');

insert into organisation (id, name, db_user, uuid, parent_organisation_id, is_voided, media_directory, username_suffix,
                          account_id, schema_name, has_analytics_db)
values (10, 'Without analytics Org A', 'orga', uuid_generate_v4(), null, false, 'orga', 'orga', 1, 'orga', false);

insert into organisation (id, name, db_user, uuid, parent_organisation_id, is_voided, media_directory, username_suffix,
                          account_id, schema_name, has_analytics_db)
values (11, 'With analytics Org B', 'orgb', uuid_generate_v4(), null, false, 'orgb', 'orgb', 1, 'orgb', true);

insert into organisation (id, name, db_user, uuid, parent_organisation_id, is_voided, media_directory, username_suffix,
                          account_id, schema_name, has_analytics_db)
values (12, 'With existing data', 'orgc', uuid_generate_v4(), null, false, 'orgc', 'orgc', 1, 'orgc', true);

insert into organisation_group(id, name, db_user, account_id, has_analytics_db, schema_name)
VALUES (10, 'Without analytics Org Groub A', 'org_group_a', 1, true, 'org_group');

insert into organisation_group_organisation (id, name, organisation_group_id, organisation_id)
VALUES (10, 'With analytics org group', 10, 10);

insert into address_level_type (id, uuid, name, is_voided, organisation_id, version, audit_id, level, parent_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (472, '855106ad-c052-42f2-9c5a-4cbd0458f70a', 'District', false, 12, 0, create_audit(), 3, null, 1, 1, '2022-03-15 17:28:35.796 +00:00', '2022-03-15 17:28:35.796 +00:00');
insert into address_level_type (id, uuid, name, is_voided, organisation_id, version, audit_id, level, parent_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (473, 'e47d897b-3877-4d7a-a676-0816b95372be', 'Block', false, 12, 0, create_audit(), 2, 472, 1, 1, '2022-03-15 17:28:51.181 +00:00', '2022-03-15 17:28:51.181 +00:00');
insert into address_level_type (id, uuid, name, is_voided, organisation_id, version, audit_id, level, parent_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (474, '1a78b68e-138f-4f4f-9381-8ab56f7610ae', 'Gram Panchayat', false, 12, 0, create_audit(), 1, 473, 1, 1, '2022-03-15 17:29:06.617 +00:00', '2022-03-15 17:29:06.617 +00:00');


insert into address_level (id, title, uuid, version, organisation_id, audit_id, is_voided, type_id, lineage, parent_id, gps_coordinates, location_properties, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107782, 'Bengaluru Urban', 'fccb202d-e5df-4a23-ad68-3fb0e88c8821', 0, 12, create_audit(), false, 472, '107782', null, null, null, 1, 1, '2022-03-15 17:29:32.261 +00:00', '2022-03-15 17:29:32.283 +00:00');
insert into address_level (id, title, uuid, version, organisation_id, audit_id, is_voided, type_id, lineage, parent_id, gps_coordinates, location_properties, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107783, 'Mysuru', 'a9f364b9-1846-4e59-81f9-6f2e2a4dbfe3', 0, 12, create_audit(), false, 472, '107783', null, null, null, 1, 1, '2022-03-15 17:29:42.542 +00:00', '2022-03-15 17:29:42.568 +00:00');
insert into address_level (id, title, uuid, version, organisation_id, audit_id, is_voided, type_id, lineage, parent_id, gps_coordinates, location_properties, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107784, 'Bangalore North', '434d6270-f44e-45ae-858b-01e38c009e02', 0, 12, create_audit(), false, 473, '107782.107784', 107782, null, null, 1, 1, '2022-03-15 17:30:47.657 +00:00', '2022-03-15 17:30:47.692 +00:00');
insert into address_level (id, title, uuid, version, organisation_id, audit_id, is_voided, type_id, lineage, parent_id, gps_coordinates, location_properties, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107785, 'Bangalore South', '77109ae8-dccd-4383-878f-68df4e3ef57c', 0, 12, create_audit(), false, 473, '107782.107785', 107782, null, null, 1, 1, '2022-03-15 17:31:02.612 +00:00', '2022-03-15 17:31:02.626 +00:00');
insert into address_level (id, title, uuid, version, organisation_id, audit_id, is_voided, type_id, lineage, parent_id, gps_coordinates, location_properties, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107786, 'Banaswadi', 'bae563a4-1ff3-4a20-b255-648225558c1e', 0, 12, create_audit(), false, 474, '107782.107784.107786', 107784, null, null, 1, 1, '2022-03-15 17:31:18.837 +00:00', '2022-03-15 17:31:18.860 +00:00');

insert into users (id, uuid, username, organisation_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, is_voided, catchment_id, is_org_admin, operating_individual_scope, settings, email, phone_number, disabled_in_cognito, name) values (3453, 'fcff7925-5689-48ad-8361-26f2f4034b98', 'user@orgc', 12, 3453, 3453, '2022-03-15 17:32:06.194 +00:00', '2022-03-15 17:32:06.194 +00:00', false, null, true, 'None', null, 'user@email.org', '+919191919191', false, 'user');

insert into subject_type (id, uuid, name, organisation_id, is_voided, audit_id, version, is_group, is_household, active, type, subject_summary_rule, allow_empty_location, unique_name, valid_first_name_regex, valid_first_name_description_key, valid_last_name_regex, valid_last_name_description_key, icon_file_s3_key, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (339, 'a95d8951-17e4-408d-98b0-ef3a6c982b96', 'Person', 12, false, create_audit(), 0, false, false, true, 'Person', '', false, false, null, null, null, null, null, 1, 1, '2022-03-15 17:32:34.268 +00:00', '2022-03-15 17:32:34.268 +00:00');
insert into subject_type (id, uuid, name, organisation_id, is_voided, audit_id, version, is_group, is_household, active, type, subject_summary_rule, allow_empty_location, unique_name, valid_first_name_regex, valid_first_name_description_key, valid_last_name_regex, valid_last_name_description_key, icon_file_s3_key, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (341, '61578f13-952f-4c06-a727-d28a2f484acf', 'Goat', 12, false, create_audit(), 0, false, false, true, 'Individual', '', false, false, null, null, null, null, null, 1, 1, '2022-03-15 17:35:00.210 +00:00', '2022-03-15 17:35:00.210 +00:00');
insert into subject_type (id, uuid, name, organisation_id, is_voided, audit_id, version, is_group, is_household, active, type, subject_summary_rule, allow_empty_location, unique_name, valid_first_name_regex, valid_first_name_description_key, valid_last_name_regex, valid_last_name_description_key, icon_file_s3_key, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (340, '59c82a6c-7084-49d6-aab5-22628fcf5aa0', 'Household', 12, false, create_audit(), 0, true, true, true, 'Household', '', false, false, null, null, null, null, null, 1, 1, '2022-03-15 17:33:12.619 +00:00', '2022-03-15 17:33:12.757 +00:00');

insert into operational_subject_type (id, uuid, name, subject_type_id, organisation_id, is_voided, audit_id, version, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (353, '19f9c741-a8b1-4be6-9aab-c0e5ae4e0cd8', 'Person', 339, 12, false, create_audit(), 0, 1, 1, '2022-03-15 17:32:34.308 +00:00', '2022-03-15 17:32:34.308 +00:00');
insert into operational_subject_type (id, uuid, name, subject_type_id, organisation_id, is_voided, audit_id, version, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (355, '6d06c7f7-189d-442b-b23e-c135dc55c9b1', 'Goat', 341, 12, false, create_audit(), 0, 1, 1, '2022-03-15 17:35:00.242 +00:00', '2022-03-15 17:35:00.242 +00:00');
insert into operational_subject_type (id, uuid, name, subject_type_id, organisation_id, is_voided, audit_id, version, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (354, '67709ffd-c7ab-4314-824c-aa1ad760a3f4', 'Household', 340, 12, false, create_audit(), 0, 1, 1, '2022-03-15 17:33:12.767 +00:00', '2022-03-15 17:33:12.767 +00:00');

insert into program (id, uuid, name, version, colour, organisation_id, audit_id, is_voided, enrolment_summary_rule, enrolment_eligibility_check_rule, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, enrolment_eligibility_check_declarative_rule) values (257, 'b3eab0c1-f393-47cc-8d2c-e2d70b207423', 'Nutrition', 0, '#ff0000', 12, create_audit(), false, '', '', true, 1, 1, '2022-03-16 15:44:40.817 +00:00', '2022-03-16 15:44:40.817 +00:00', null);
insert into operational_program (id, uuid, organisation_id, program_id, version, audit_id, name, is_voided, program_subject_label, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (281, 'aea7929a-c33b-4473-879d-c9f272159f86', 12, 257, 0, create_audit(), 'Nutrition', false, '', 1, 1, '2022-03-16 15:44:41.040 +00:00', '2022-03-16 15:44:41.040 +00:00');


insert into encounter_type (id, name, concept_id, uuid, version, organisation_id, audit_id, is_voided, encounter_eligibility_check_rule, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, encounter_eligibility_check_declarative_rule) values (1053, 'Growth Monitoring', null, '95097733-b555-4f97-803a-b609a119c8e4', 0, 12, create_audit(), false, '', true, 1, 1, '2022-03-16 15:49:17.434 +00:00', '2022-03-16 15:49:17.434 +00:00', null);
insert into operational_encounter_type (id, uuid, organisation_id, encounter_type_id, version, audit_id, name, is_voided, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (1062, '807dfdf6-b314-4aff-812d-6bfaa38d67c2', 12, 1053, 0, create_audit(), 'Growth Monitoring', false, 1, 1, '2022-03-16 15:49:17.477 +00:00', '2022-03-16 15:49:17.477 +00:00');

insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107560, 'Numeric', null, null, null, null, 'Numeric Question', 'f005ccf7-f714-4615-a2a0-26efa2da6491', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 15:49:55.019 +00:00', '2022-03-16 15:49:55.019 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107561, 'Text', null, null, null, null, 'Text Question', '701b68df-dc52-4d69-ab91-f03a70ac1bbc', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 15:50:17.564 +00:00', '2022-03-16 15:50:17.564 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107562, 'NA', null, null, null, null, 'Alpha', '21bd8849-b6b8-48e8-a7d6-7a615209658b', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 16:14:28.434 +00:00', '2022-03-16 16:14:28.434 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107566, 'NA', null, null, null, null, 'Phi', '4f4cf8f5-6571-4518-a333-d56452bc52e7', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 16:15:01.787 +00:00', '2022-03-16 16:15:01.787 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107563, 'NA', null, null, null, null, 'Gamma', 'c42561c7-30dc-4c47-82d7-9ea15d72024f', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 16:14:28.434 +00:00', '2022-03-16 16:14:28.434 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107568, 'NA', null, null, null, null, 'Kappa', '120a6539-da27-4d77-a60a-6feb569e7add', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 16:15:01.788 +00:00', '2022-03-16 16:15:01.788 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107564, 'NA', null, null, null, null, 'Beta', '0f8719fb-c86d-4f2e-9dd6-1d257a925eba', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 16:14:28.434 +00:00', '2022-03-16 16:14:28.434 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107565, 'Coded', null, null, null, null, 'Single Select Question', 'b6f63312-ae34-4405-9a6f-80aa5a9f0aab', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 16:14:28.569 +00:00', '2022-03-16 16:14:28.569 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107567, 'NA', null, null, null, null, 'Delta', '83e484fe-ef93-4c9c-83d0-d6e869483a2d', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 16:15:01.788 +00:00', '2022-03-16 16:15:01.788 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107569, 'Coded', null, null, null, null, 'Multi Select Question', '6f44737e-5bc5-4513-ac70-89697cedbc96', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 16:15:01.912 +00:00', '2022-03-16 16:15:01.912 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107570, 'Date', null, null, null, null, 'Date Question', '60faf754-baf0-4019-9b4d-43bc2ae72f1e', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 16:15:49.693 +00:00', '2022-03-16 16:15:49.693 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107571, 'Duration', null, null, null, null, 'Duration Question', '73180110-f639-411e-9d6d-b6a0f6c9fa3b', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 16:16:39.998 +00:00', '2022-03-16 16:16:39.998 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107572, 'DateTime', null, null, null, null, 'DateTime Question', '847e0304-f0ca-47a8-91cc-615aa941a7e7', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-03-16 16:17:06.264 +00:00', '2022-03-16 16:17:06.264 +00:00');
insert into concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (107573, 'PhoneNumber', null, null, null, null, 'Phone Number Question', '7285f4f3-78f2-4276-bb26-35cca697d84d', 0, null, 12, false, create_audit(), '[{"key": "verifyPhoneNumber", "value": false}]', true, 1, 1, '2022-03-16 16:18:07.447 +00:00', '2022-03-16 16:18:30.341 +00:00');
INSERT INTO concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) VALUES (107577, 'NA', null, null, null, null, 'White', 'c6012f8d-d705-4d72-a0ba-45d8d37c730b', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-04-06 16:51:15.328 +00:00', '2022-04-06 16:51:15.328 +00:00');
INSERT INTO concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) VALUES (107578, 'NA', null, null, null, null, 'Black', 'a5f8335c-0be1-46a1-b12a-bd3e5ccad60e', 0, null, 12, false, create_audit(), null, true, 1, 1, '2022-04-06 16:51:15.328 +00:00', '2022-04-06 16:51:15.328 +00:00');
INSERT INTO concept (id, data_type, high_absolute, high_normal, low_absolute, low_normal, name, uuid, version, unit, organisation_id, is_voided, audit_id, key_values, active, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) VALUES (107579, 'Coded', null, null, null, null, 'Goat Color', '79deda49-7e16-4980-a784-c54054da8931', 0, null, 12, false, create_audit(), '[]', true, 1, 1, '2022-04-06 16:51:15.414 +00:00', '2022-04-06 16:51:15.414 +00:00');



insert into concept_answer (id, concept_id, answer_concept_id, uuid, version, answer_order, organisation_id, abnormal, is_voided, uniq, audit_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (98934, 107565, 107564, 'cbde6ba5-22ae-410c-857c-2b41de35012d', 0, 1, 12, false, false, false, create_audit(), 1, 1, '2022-03-16 16:14:28.601 +00:00', '2022-03-16 16:14:28.601 +00:00');
insert into concept_answer (id, concept_id, answer_concept_id, uuid, version, answer_order, organisation_id, abnormal, is_voided, uniq, audit_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (98935, 107565, 107562, '7cf07e91-025c-4b8e-b79d-4428e177f88b', 0, 0, 12, false, false, false, create_audit(), 1, 1, '2022-03-16 16:14:28.617 +00:00', '2022-03-16 16:14:28.617 +00:00');
insert into concept_answer (id, concept_id, answer_concept_id, uuid, version, answer_order, organisation_id, abnormal, is_voided, uniq, audit_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (98936, 107565, 107563, 'd0500644-2fb8-4751-8316-72a049d48495', 0, 2, 12, false, false, false, create_audit(), 1, 1, '2022-03-16 16:14:28.623 +00:00', '2022-03-16 16:14:28.623 +00:00');
insert into concept_answer (id, concept_id, answer_concept_id, uuid, version, answer_order, organisation_id, abnormal, is_voided, uniq, audit_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (98937, 107569, 107568, 'b3ecf3aa-cee9-49ab-8bfe-986786c4fa30', 0, 1, 12, false, false, false, create_audit(), 1, 1, '2022-03-16 16:15:01.935 +00:00', '2022-03-16 16:15:01.935 +00:00');
insert into concept_answer (id, concept_id, answer_concept_id, uuid, version, answer_order, organisation_id, abnormal, is_voided, uniq, audit_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (98938, 107569, 107567, '3f9936be-bb5d-4e10-a13a-ba662e9cfaac', 0, 0, 12, false, false, false, create_audit(), 1, 1, '2022-03-16 16:15:01.946 +00:00', '2022-03-16 16:15:01.946 +00:00');
insert into concept_answer (id, concept_id, answer_concept_id, uuid, version, answer_order, organisation_id, abnormal, is_voided, uniq, audit_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (98939, 107569, 107566, '47a3bfc9-06f5-45cf-b04e-257b74dce6c7', 0, 2, 12, false, false, false, create_audit(), 1, 1, '2022-03-16 16:15:01.954 +00:00', '2022-03-16 16:15:01.954 +00:00');
INSERT INTO concept_answer (id, concept_id, answer_concept_id, uuid, version, answer_order, organisation_id, abnormal, is_voided, uniq, audit_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) VALUES (98942, 107579, 107578, 'fba13f46-5e48-4dbd-88b4-ad6236d36365', 0, 0, 12, false, false, false, create_audit(), 1, 1, '2022-04-06 16:51:15.419 +00:00', '2022-04-06 16:51:15.419 +00:00');
INSERT INTO concept_answer (id, concept_id, answer_concept_id, uuid, version, answer_order, organisation_id, abnormal, is_voided, uniq, audit_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) VALUES (98943, 107579, 107577, '18df8bb1-f634-4e0c-89de-bf1cd33fb916', 0, 1, 12, false, false, false, create_audit(), 1, 1, '2022-04-06 16:51:15.427 +00:00', '2022-04-06 16:51:15.427 +00:00');


insert into form (id, name, form_type, uuid, version, organisation_id, audit_id, is_voided, decision_rule, validation_rule, visit_schedule_rule, checklists_rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, validation_declarative_rule, decision_declarative_rule, visit_schedule_declarative_rule) values (2655, 'Goat Registration', 'IndividualProfile', '7923af6f-8467-4429-ac98-506953e24030', 0, 12, create_audit(), false, null, null, null, null, 1, 1, '2022-03-15 17:35:00.262 +00:00', '2022-03-15 17:35:00.262 +00:00', null, null, null);
insert into form (id, name, form_type, uuid, version, organisation_id, audit_id, is_voided, decision_rule, validation_rule, visit_schedule_rule, checklists_rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, validation_declarative_rule, decision_declarative_rule, visit_schedule_declarative_rule) values (2653, 'Person Registration', 'IndividualProfile', 'e237b92c-64a5-4bd6-b595-7668cb0ba111', 0, 12, create_audit(), false, '', '', '', '', 1, 1, '2022-03-15 17:32:34.351 +00:00', '2022-03-16 16:19:20.417 +00:00', null, null, null);
insert into form (id, name, form_type, uuid, version, organisation_id, audit_id, is_voided, decision_rule, validation_rule, visit_schedule_rule, checklists_rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, validation_declarative_rule, decision_declarative_rule, visit_schedule_declarative_rule) values (2654, 'Household Registration', 'IndividualProfile', 'c8a89618-7052-4a4c-9eba-f2ae544aa3a9', 0, 12, create_audit(), false, null, null, null, null, 1, 1, '2022-03-15 17:33:12.779 +00:00', '2022-03-15 17:33:12.779 +00:00', null, null, null);
insert into form (id, name, form_type, uuid, version, organisation_id, audit_id, is_voided, decision_rule, validation_rule, visit_schedule_rule, checklists_rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, validation_declarative_rule, decision_declarative_rule, visit_schedule_declarative_rule) values (2656, 'Nutrition Enrolment', 'ProgramEnrolment', '6130ed34-ebc5-4fa0-adaf-35f0a15fea59', 0, 12, create_audit(), false, null, null, null, null, 1, 1, '2022-03-16 15:44:41.090 +00:00', '2022-03-16 15:44:41.090 +00:00', null, null, null);
insert into form (id, name, form_type, uuid, version, organisation_id, audit_id, is_voided, decision_rule, validation_rule, visit_schedule_rule, checklists_rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, validation_declarative_rule, decision_declarative_rule, visit_schedule_declarative_rule) values (2657, 'Nutrition Exit', 'ProgramExit', '1582285b-172b-4c8e-af96-52bacb1836fc', 0, 12, create_audit(), false, null, null, null, null, 1, 1, '2022-03-16 15:44:41.216 +00:00', '2022-03-16 15:44:41.216 +00:00', null, null, null);
INSERT INTO form (id, name, form_type, uuid, version, organisation_id, audit_id, is_voided, decision_rule, validation_rule, visit_schedule_rule, checklists_rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, validation_declarative_rule, decision_declarative_rule, visit_schedule_declarative_rule) VALUES (2658, 'Growth Monitoring Encounter', 'ProgramEncounter', 'facb4951-9ecf-4f2e-bc4e-0f3ef6bbd67a', 0, 12, create_audit(), false, '', '', '', '', 1, 1, '2022-03-16 15:49:17.499 +00:00', '2022-04-06 16:59:27.297 +00:00', null, null, null);
insert into form (id, name, form_type, uuid, version, organisation_id, audit_id, is_voided, decision_rule, validation_rule, visit_schedule_rule, checklists_rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, validation_declarative_rule, decision_declarative_rule, visit_schedule_declarative_rule) values (2659, 'Growth Monitoring Encounter Cancellation', 'ProgramEncounterCancellation', 'cca85c24-68d3-470f-9443-95c458470f54', 0, 12, create_audit(), false, null, null, null, null, 1, 1, '2022-03-16 15:49:17.572 +00:00', '2022-03-16 15:49:17.572 +00:00', null, null, null);


insert into form_element_group (id, name, form_id, uuid, version, display_order, display, organisation_id, audit_id, is_voided, rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, declarative_rule) values (5569, 'Second page', 2653, '88e57ffb-3d30-4fd5-9b22-7cbc015ee3c3', 0, 1, 'Second page', 12, create_audit(), false, null, 1, 1, '2022-03-16 15:51:44.666 +00:00', '2022-03-16 15:51:44.666 +00:00', null);

insert into form_element (id, name, display_order, is_mandatory, key_values, concept_id, form_element_group_id, uuid, version, organisation_id, type, valid_format_regex, valid_format_description_key, audit_id, is_voided, rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, declarative_rule) values (40102, 'Numeric Question', 1, false, '[]', 107560, 5569, 'b403247c-04e5-48ec-bbd3-1686e7a44f57', 0, 12, 'SingleSelect', null, null, create_audit(), false, null, 1, 1, '2022-03-16 15:51:44.705 +00:00', '2022-03-16 15:51:44.705 +00:00', null);
insert into form_element (id, name, display_order, is_mandatory, key_values, concept_id, form_element_group_id, uuid, version, organisation_id, type, valid_format_regex, valid_format_description_key, audit_id, is_voided, rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, declarative_rule) values (40103, 'Text Question', 2, false, '[]', 107561, 5569, '6237715a-7949-4492-abd7-a6f6c5d58e71', 0, 12, 'SingleSelect', null, null, create_audit(), false, null, 1, 1, '2022-03-16 15:51:44.744 +00:00', '2022-03-16 15:51:44.744 +00:00', null);
insert into form_element (id, name, display_order, is_mandatory, key_values, concept_id, form_element_group_id, uuid, version, organisation_id, type, valid_format_regex, valid_format_description_key, audit_id, is_voided, rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, declarative_rule) values (40104, 'Single Select Question', 3, false, '[]', 107565, 5569, '962f670d-e315-4ca5-befc-f6e6249af157', 0, 12, 'SingleSelect', null, null, create_audit(), false, null, 1, 1, '2022-03-16 16:15:12.816 +00:00', '2022-03-16 16:15:12.816 +00:00', null);
insert into form_element (id, name, display_order, is_mandatory, key_values, concept_id, form_element_group_id, uuid, version, organisation_id, type, valid_format_regex, valid_format_description_key, audit_id, is_voided, rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, declarative_rule) values (40105, 'Multi Select Question', 4, false, '[]', 107569, 5569, 'a3faba5c-6371-4104-8cf4-21275c076cdf', 0, 12, 'MultiSelect', null, null, create_audit(), false, null, 1, 1, '2022-03-16 16:15:12.854 +00:00', '2022-03-16 16:15:12.854 +00:00', null);
insert into form_element (id, name, display_order, is_mandatory, key_values, concept_id, form_element_group_id, uuid, version, organisation_id, type, valid_format_regex, valid_format_description_key, audit_id, is_voided, rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, declarative_rule) values (40106, 'Date Question', 5, false, '[]', 107570, 5569, 'd61f966c-a9ca-4732-9e2f-8db46db0dd54', 0, 12, 'SingleSelect', null, null, create_audit(), false, null, 1, 1, '2022-03-16 16:19:20.374 +00:00', '2022-03-16 16:19:20.374 +00:00', null);
insert into form_element (id, name, display_order, is_mandatory, key_values, concept_id, form_element_group_id, uuid, version, organisation_id, type, valid_format_regex, valid_format_description_key, audit_id, is_voided, rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, declarative_rule) values (40107, 'DateTime Question', 6, false, '[]', 107572, 5569, 'fd9ffd0c-d442-41d3-8154-e5d34eb78eab', 0, 12, 'SingleSelect', null, null, create_audit(), false, null, 1, 1, '2022-03-16 16:19:20.394 +00:00', '2022-03-16 16:19:20.394 +00:00', null);
insert into form_element (id, name, display_order, is_mandatory, key_values, concept_id, form_element_group_id, uuid, version, organisation_id, type, valid_format_regex, valid_format_description_key, audit_id, is_voided, rule, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, declarative_rule) values (40108, 'Duration Question', 7, false, '[]', 107571, 5569, '2a5b0d81-b902-4020-9346-91811b4dcf11', 0, 12, 'SingleSelect', null, null, create_audit(), false, null, 1, 1, '2022-03-16 16:19:20.408 +00:00', '2022-03-16 16:19:20.408 +00:00', null);


insert into form_mapping (id, form_id, uuid, version, entity_id, observations_type_entity_id, organisation_id, audit_id, is_voided, subject_type_id, enable_approval, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (9978, 2653, 'd38a240c-d5da-4806-9d8d-dba1b790599b', 0, null, null, 12, create_audit(), false, 339, false, 1, 1, '2022-03-15 17:32:34.463 +00:00', '2022-03-15 17:32:34.463 +00:00');
insert into form_mapping (id, form_id, uuid, version, entity_id, observations_type_entity_id, organisation_id, audit_id, is_voided, subject_type_id, enable_approval, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (9979, 2654, '4a07443e-2de0-4440-9e9d-d33563d9a139', 0, null, null, 12, create_audit(), false, 340, false, 1, 1, '2022-03-15 17:33:12.975 +00:00', '2022-03-15 17:33:12.975 +00:00');
insert into form_mapping (id, form_id, uuid, version, entity_id, observations_type_entity_id, organisation_id, audit_id, is_voided, subject_type_id, enable_approval, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (9980, 2655, 'a22c1a13-1551-424c-ab42-192ace3302f6', 0, null, null, 12, create_audit(), false, 341, false, 1, 1, '2022-03-15 17:35:00.405 +00:00', '2022-03-15 17:35:00.405 +00:00');
insert into form_mapping (id, form_id, uuid, version, entity_id, observations_type_entity_id, organisation_id, audit_id, is_voided, subject_type_id, enable_approval, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (9981, 2656, '8de8fdf5-142f-43fa-a9df-edd385089e85', 0, 257, null, 12, create_audit(), false, 339, false, 1, 1, '2022-03-16 15:44:41.204 +00:00', '2022-03-16 15:44:41.204 +00:00');
insert into form_mapping (id, form_id, uuid, version, entity_id, observations_type_entity_id, organisation_id, audit_id, is_voided, subject_type_id, enable_approval, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (9982, 2657, '9b913547-7884-4967-b95d-3a198b9d3816', 0, 257, null, 12, create_audit(), false, 339, false, 1, 1, '2022-03-16 15:44:41.252 +00:00', '2022-03-16 15:44:41.252 +00:00');
insert into form_mapping (id, form_id, uuid, version, entity_id, observations_type_entity_id, organisation_id, audit_id, is_voided, subject_type_id, enable_approval, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (9983, 2658, '4fecee8e-721f-40d4-b14e-616e5cc3f4b6', 0, 257, 1053, 12, create_audit(), false, 339, false, 1, 1, '2022-03-16 15:49:17.562 +00:00', '2022-03-16 15:49:17.562 +00:00');
insert into form_mapping (id, form_id, uuid, version, entity_id, observations_type_entity_id, organisation_id, audit_id, is_voided, subject_type_id, enable_approval, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) values (9984, 2659, '99a9a03b-000e-471c-a3d4-ee74bde81b95', 0, 257, 1053, 12, create_audit(), false, 339, false, 1, 1, '2022-03-16 15:49:17.610 +00:00', '2022-03-16 15:49:17.610 +00:00');

INSERT INTO public.decision_concept (id, concept_id, form_id) VALUES (145, 107579, 2658);

INSERT INTO gender (id, uuid, name, concept_id, version, audit_id, is_voided, organisation_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) VALUES (388, 'd05f3f7b-3b2e-48b2-886c-af81faad8312', 'Male', null, 0, create_audit(), false, 12, 1, 1, '2022-03-15 17:28:05.791 +00:00', '2022-03-15 17:28:05.791 +00:00');
INSERT INTO gender (id, uuid, name, concept_id, version, audit_id, is_voided, organisation_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) VALUES (389, '3c343f09-a615-41ba-a9ed-8c66ab6edba5', 'Female', null, 0, create_audit(), false, 12, 1, 1, '2022-03-15 17:28:05.888 +00:00', '2022-03-15 17:28:05.888 +00:00');
INSERT INTO gender (id, uuid, name, concept_id, version, audit_id, is_voided, organisation_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time) VALUES (390, '779fc6ef-7de2-4450-b7f5-7894ceaf29ba', 'Other', null, 0, create_audit(), false, 12, 1, 1, '2022-03-15 17:28:05.897 +00:00', '2022-03-15 17:28:05.897 +00:00');



INSERT INTO individual (id, uuid, address_id, observations, version, date_of_birth, date_of_birth_verified, gender_id, registration_date, organisation_id, first_name, last_name, is_voided, audit_id, facility_id, registration_location, subject_type_id, legacy_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, sync_concept_1_value, sync_concept_2_value) VALUES (574169, '4788aeeb-400a-4d07-95eb-e11f8cc9d2df', 107786, '{}', 0, null, false, null, '2022-04-05', 12, 'Goatee', null, false, create_audit(), null, null, 341, null, 1, 1, '2022-04-05 11:26:52.285 +00:00', '2022-04-05 11:26:52.285 +00:00', null, null);
INSERT INTO individual (id, uuid, address_id, observations, version, date_of_birth, date_of_birth_verified, gender_id, registration_date, organisation_id, first_name, last_name, is_voided, audit_id, facility_id, registration_location, subject_type_id, legacy_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, sync_concept_1_value, sync_concept_2_value) VALUES (574170, '751bb8c8-ef18-4250-a73d-73106e7a5b56', 107786, '{"60faf754-baf0-4019-9b4d-43bc2ae72f1e": "2022-04-04T18:30:00.000Z", "6f44737e-5bc5-4513-ac70-89697cedbc96": ["83e484fe-ef93-4c9c-83d0-d6e869483a2d", "120a6539-da27-4d77-a60a-6feb569e7add"], "701b68df-dc52-4d69-ab91-f03a70ac1bbc": "This is a text", "73180110-f639-411e-9d6d-b6a0f6c9fa3b": "P12Y12M", "847e0304-f0ca-47a8-91cc-615aa941a7e7": "2022-04-05T11:46:34.000Z", "b6f63312-ae34-4405-9a6f-80aa5a9f0aab": "21bd8849-b6b8-48e8-a7d6-7a615209658b", "f005ccf7-f714-4615-a2a0-26efa2da6491": 1029.2}', 0, '2001-04-05', false, 389, '2022-04-05', 12, 'Personal', 'Person', false, create_audit(), null, null, 339, null, 1, 1, '2022-04-05 11:47:04.749 +00:00', '2022-04-05 11:47:04.749 +00:00', null, null);
INSERT INTO individual (id, uuid, address_id, observations, version, date_of_birth, date_of_birth_verified, gender_id, registration_date, organisation_id, first_name, last_name, is_voided, audit_id, facility_id, registration_location, subject_type_id, legacy_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, sync_concept_1_value, sync_concept_2_value) VALUES (574171, 'badfdedc-a6f8-4f8f-bb2f-d4f24c7449c9', 107786, '{}', 0, null, false, null, '2022-04-05', 12, 'Sharma ki pariwar', null, false, create_audit(), null, null, 340, null, 1, 1, '2022-04-05 11:47:29.322 +00:00', '2022-04-05 11:47:29.322 +00:00', null, null);

INSERT INTO program_enrolment (id, program_id, individual_id, program_outcome_id, observations, program_exit_observations, enrolment_date_time, program_exit_date_time, uuid, version, organisation_id, audit_id, is_voided, enrolment_location, exit_location, legacy_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, address_id, sync_concept_1_value, sync_concept_2_value) VALUES (150708, 257, 574170, null, '{}', '{}', '2022-04-06 07:14:57.000 +00:00', null, '6a57ebe0-bed5-426f-be9b-2e21b4202d20', 0, 12, create_audit(), false, null, null, null, 1, 1, '2022-04-06 07:15:01.443 +00:00', '2022-04-06 07:15:01.443 +00:00', 107786, null, null);

INSERT INTO program_encounter (id, observations, earliest_visit_date_time, encounter_date_time, program_enrolment_id, uuid, version, encounter_type_id, name, max_visit_date_time, organisation_id, cancel_date_time, cancel_observations, audit_id, is_voided, encounter_location, cancel_location, legacy_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time, address_id, individual_id, sync_concept_1_value, sync_concept_2_value) VALUES (877067, '{"79deda49-7e16-4980-a784-c54054da8931": "a5f8335c-0be1-46a1-b12a-bd3e5ccad60e"}', null, '2022-04-06 07:15:07.000 +00:00', 150708, 'd73e0f79-4876-42e3-b9e6-f9fb131fb8a3', 0, 1053, 'Growth Monitoring', null, 12, null, '{}', create_audit(), false, null, null, null, 1, 1, '2022-04-06 07:15:10.982 +00:00', '2022-04-06 07:15:10.982 +00:00', 107786, 574170, null, null);
