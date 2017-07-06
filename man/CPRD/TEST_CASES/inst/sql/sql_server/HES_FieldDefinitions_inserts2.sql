use @cdm_database_schema;

GO
/****** Object:  Table [dbo].[HES_FieldDefinitions]    Script Date: 22-Jun-2017 09:08:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HES_FieldDefinitions](
	[FieldId] [int] NOT NULL,
	[HES_FieldName] [nvarchar](max) NULL,
	[FieldName] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[Class] [nvarchar](200) NULL,
	[LengthFormat] [nvarchar](50) NULL,
	[Availability] [nvarchar](300) NULL,
	[DataCleaning] [nvarchar](max) NULL,
	[IsCategorical] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1592, N'Admission date check flag', N'adm_cfl', N'Codes in this field indicate whether the patient''s admission date is valid.', N'Admissions', N'1n', N'All years', N'Not applicable (derived by rule 35)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1593, N'Date of admission', N'admidate', N'This field contains the date the patient was admitted to hospital at the start of a hospital spell. 
Admidate is recorded on all episodes within a spell.', N'Admissions', N'dd/mm/yyyy (Date)', N'All years', N'Rule 35', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1594, N'Date of decision to admit', N'elecdate', N'This field contains the date on which a consultant, or another member of the clinical staff, 
decided to admit the patient to a hospital. 
The patient may or may not be admitted immediately. The time between elecdate and 
admidate (admission date) is known as the waiting time.', N'Admissions', N'dd/mm/yyyy (Date)', N'All years', N'Rules 40 and 45', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1595, N'Date of decision to admit check flag', N'elec_cfl', N'Codes in this field indicate whether the decision to admit date is valid.', N'Admissions', N'1n', N'All years', N'Not applicable: derived by Rules 40 and 45', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1596, N'First regular day or night admission', N'firstreg', N'This field indicates whether the episode falls within a sequence of regular day and night 
admissions and, if so, whether it is the first or subsequent episode within the sequence.', N'Admissions', N'1n', N'From 2002-03', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1597, N'Method of admission', N'admimeth', N'This field contains a code which identifies how the patient was admitted to hospital. Admimeth 
is recorded on the first and also all subsequent episodes within the spell (ie where the spell is 
made up of more than one episode).', N'Admissions', N'2n', N'All years', N'Rules 65, 70 and 320', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1598, N'Source of admission', N'admisorc', N'This field contains a code which identifies where the patient was immediately prior to 
admission. 
Most patients are admitted from home, but there are some significant exceptions. In 
particular, this field differentiates between patients admitted from home and patients 
transferred from another hospital provider or institution.', N'Admissions', N'2n', N'All years', N'Rule 80', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1599, N'Waiting time', N'elecdur', N'This derived field contains the difference in days between the date on which it was decided to 
admit the patient (elecdate) and the actual admission date (admidate). 
Elecdur is only applicable where an elective admission (ie the admission method is 11, 12 or 
13) was scheduled and took place.', N'Admissions', N'4n', NULL, N'Not applicable (derived by rule 270)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1600, N'ACP sequence number', N'acpseq', N'Augmented care period sequence number.', N'Augmented/critical care period', N'1n', N'From 1 October 1997 to 31 March 2006', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1601, N'Augmented care location', N'acploc', N'This field gives the location of a patient during a period of augmented care.', N'Augmented/critical care period', N'2n', N'From 1 October 1997 to 31 March 2006', N'Rules 950 and 960', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1602, N'Augmented care period disposal', N'acpdisp', N'This field gives the destination of a discharged patient after a period of augmented care. 
Compare this field with disdest (destination on discharge from a hospital episode).', N'Augmented/critical care period', N'2n', N'From 1 October 1997 to 31 March 2006', N'Rules 920 and 930', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1603, N'Augmented care period end date', N'acpend', N'This field gives the end date of a period of augmented care (a null entry indicates that this 
data is not applicable).', N'Augmented/critical care period', N'dd/mm/yyyy (Date)', N'From 1 October 1997 to 31 March 2006', N'Rule 940', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1604, N'Augmented care period local ID', N'acplcid', N'There are no nationally agreed values for this item. This field contains sensitive data. Access 
to it requires the approval of the Database Monitoring Sub-Group (DMSG).', N'Augmented/critical care period', N'8an', N'From 2002-03 to 31 March 2006', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1605, N'Augmented care period number', N'acpn', N'This field contains a number representing the order of an episode within a sequence of 
episodes that make up a period of augmented care.', N'Augmented/critical care period', N'2n', N'From 1 October 1997 to 31 March 2006', N'Rule 970', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1606, N'Augmented care period outcome indicator', N'acpout', N'This field identifies whether a patient survived. For deaths it indicates whether organs were 
donated. 
Organs are defined as whole organs such as heart, lung, liver, kidney and pancreas. The 
value 03 does not include parts of organs such as corneas, heart valves, etc.', N'Augmented/critical care period', N'2n', N'From 1 October 1997 to 31 March 2006', N'Rule 980 and Rule 990', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1607, N'Augmented care period planned indicator', N'acpplan', N'This field indicates whether any part of the ACP was planned in advance of admission to the 
ACP location.', N'Augmented/critical care period', N'1n', N'From 1 October 1997 to 31 March 2006', N'Rule 1000', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1608, N'Augmented care period source', N'acpsour', N'This field defines where the patient was immediately before the period of augmented care. 
Compare this field with admisorc (source of patient for a hospital episode).', N'Augmented/critical care period', N'2n', N'From 1 October 1997 to 31 March 2006', N'Rule 900 and Rule 910', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1609, N'Augmented care period speciality function code', N'acpspef', N'This field contains the code for the main specialty of the consultant clinically managing the 
period of augmented care. 
This consultant is not necessarily the same as the one responsible for the hospital episode. 
Where a patient is cared for by a team of specialists within an Intensive Care rota, this field 
contains the specialty of the team''s clinical director. 
Where there are several specialties involved but none is considered responsible, this field 
contains the specialty of the consultant admitting the patient to the period of augmented care. 
If no specific consultant or team can be identified as organising the care associated with the 
ACP, then this should be the same as for the related consultant episode.', N'Augmented/critical care period', N'3n', N'From 1 October 1997 to 31 March 2006', N'Rule 1010', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1610, N'Augmented care period start date', N'acpstar', N'This field states the start date of a period of augmented care.', N'Augmented/critical care period', N'dd/mm/yyyy = Date', N'From 1 October 1997 to 31 March 2006', N'Rule 1020', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1611, N'High-dependency care level', N'depdays', N'This field contains the number of days of high dependency care in a period of augmented 
care.', N'Augmented/critical care period', N'4n', N'From 1 October 1997 to 31 March 2006', N'Rule 1030', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1612, N'Intensive care level days', N'intdays', N'This field contains the number of days of intensive care in a period of augmented care.', N'Augmented/critical care period', N'4n', N'From 1 October 1997 to 31 March 2006', N'Rule 1040', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1613, N'Number of augmented care periods within episode', N'numacp', N'This derived field gives the number of augmented care periods (ACPs) within episode.', N'Augmented/critical care period', N'2n', N'From 1 October 1997 to 31 March 2006', N'Not applicable (derived by rule 1060)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1614, N'Number of organ systems supported', N'orgsup', N'This field contains the number of organ support systems used (up to five) during a period of 
augmented care.', N'Augmented/critical care period', N'2n', N'From 1 October 1997 to 31 March 2006', N'Rule 1050', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1615, N'Date of operation', N'opdte_nn', N'This field contains the dates for operations recorded in the operation codes (oper_nn) field. 
There is room for twenty-four dates (twelve prior to April 2002).', N'Clinical', N'dd/mm/yyyy (Date)', NULL, N'Rules 480, 485, 610 and 620', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1616, N'All diagnosis codes', N'diag_nn', N'There are twenty fields (fourteen before April 2007 and seven before April 2002), diag_01 to 
diag_20, which contain information about a patient''s illness or condition. 
The field diag_01 contains the primary diagnosis. The other fields contain 
secondary/subsidiary diagnoses. The codes are defined in the International Statistical 
Classification of Diseases, Injuries and Causes of Death. 
HES records currently use the tenth revision (ICD-10). Prior to April 1995, the ninth revision 
was used (ICD-9). Diagnosis codes start with a letter and are followed by two or three digits. 
The third digit identifies variations on a main diagnosis code containing two digits. 
The third digit is preceded by a full stop in ICD-10, but this is not stored in the field.', N'Clinical', N'6an', NULL, N'Rules 460, 470, 490, 500, 510, 530, 630, 640, 840 and 850', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1617, N'Cause code - 4 characters', N'cause4dg', N'This item is a copy of the initial 4 characters of the first diagnosis code that represents an 
external cause, eg accidents or poisoning.', N'Clinical', N'4an', NULL, N'Rules 460, 470, 510 and 530 (then derived by rule 580)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1618, N'Cause code - 3 characters', N'cause3', N'This item is a copy of the initial 3 characters of the first diagnosis code that represents an 
external cause, eg accidents or poisoning.', N'Clinical', N'3an', NULL, N'Rules 460, 470, 510 and 530 (then derived by rule 580)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1619, N'Cause code', N'cause', N'External cause of injury or poisoning. This item is a copy of the first diagnosis code that 
represents an external cause.', N'Clinical', N'6an', NULL, N'Rules 460, 470, 510 and 530 (then derived by rule 580)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1620, N'Intended management', N'intmanig', N'This field contains a code that defines what was planned to happen. The patient classification 
(classpat) defines what actually happened.', N'Clinical', N'1n', N'From 1997-98', N'Rule 120', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1621, N'Main operative procedure - 3 characters', N'oper3', N'This provides the first three characters of the main operation (oper_1).', N'Clinical', N'3an, - or &', NULL, N'Not applicable (this item is derived from a cleaned field)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1622, N'Main specialty', N'mainspef', N'This field contains a code that defines the specialty under which the consultant is contracted. 
It can be compared with tretspef, the specialty under which the consultant worked.', N'Clinical', N'3n or &', NULL, N'Rule 90 and Rule 350', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1623, N'All operative procedure codes', N'oper_nn', N'There are twenty-four fields (twelve before April 2007 and four prior to April 2002), oper_01 to 
oper_24, which contain information about a patient''s operations. 
The field oper_01 contains the main (ie most resource intensive) procedure. The other fields 
contain secondary procedures. 
The codes are defined in the Tabular List of the Classification of Surgical Operations and 
Procedures. The current version is OPCS4. Procedure codes start with a letter and are 
followed by two or three digits. 
The third digit identifies variations on a main procedure code containing two digits. The third 
digit is preceded by a full stop in OPCS4, but this is not stored in the field. A single operation 
may contain more than one procedure.', N'Clinical', N'4an, - or &', NULL, N'Rules 450, 540, 550, 560, 610 and 620', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1624, N'Operation status code', N'operstat', N'Status of operation.', N'Clinical', N'1n', N'From 2002-03', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1625, N'Patient classification', N'classpat', N'This field identifies day cases, ordinary admissions, regular day and regular night attenders, 
and the special case of mothers and babies using only delivery facilities. 
Data about regular day and regular night attenders are not available for analysis prior to 
2002-03. Since the introduction of the NHS wide clearing service in April 1996, this field has 
been derived from related items in the Commissioning Data Set (eg intended management).', N'Clinical', N'1n', NULL, N'Not applicable (derived by rule 260)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1626, N'Post-operative duration', N'posopdur', N'This derived field contains the difference in days between the date of the main operation 
(opdte_01) and the date the episode ended (epiend).', N'Clinical', N'3n', NULL, N'Not applicable (derived by rule 1070)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1627, N'Pre-operative duration', N'preopdur', N'This derived field contains the difference in days between the date the episode started 
(epistart) and the date of the main operation (opdte_01).', N'Clinical', N'3n', NULL, N'Not applicable (derived by rule 1075)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1628, N'Primary diagnosis - 4 characters', N'diag4', N'This provides the first four characters of the primary diagnosis (diag_01).', N'Clinical', N'4an', NULL, N'Not applicable (derived from a cleaned field)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1629, N'Primary diagnosis - 3 characters', N'diag3', N'This provides the first three characters of the primary diagnosis (diag_01).', N'Clinical', N'3an', NULL, N'Not applicable (derived from a cleaned field)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1630, N'Primary diagnosis chapter', N'chapter', N'This provides the chapter of the primary diagnosis (diag_01).', N'Clinical', N'4an', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1631, N'Treatment specialty', N'tretspef', N'This field contains a code that defines the specialty in which the consultant was working 
during the period of care. It can be compared with mainspef, the specialty under which the 
consultant is contracted. 
Prior to 1 April 1996, this data item contained the code for the sub-specialty (subspef). From 
April 2004 a new list of treatment specialities was introduced (see below). 
The new list describes the specialised service within which the patient was treated.', N'Clinical', N'3n or &', NULL, N'Rule 100', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1632, N'Ambulatory Care Sensitive Condition Flag', N'Acscflag', N'Ambulatory Care Sensitive Condition flag is derived for finished APC episodes where the 
admission method is ''emergency''. The flag indicates whether the episode contains a 
diagnosis which is ambulatory care sensitive', N'Diagnosis', N'1n', N'2007-2008 onwards', N'Derived by rule 509', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1633, N'Principal alcohol related diagnosis', N'Alcdiag', N'Indicates the diagnosis code with the highest alcohol attributable fraction. Where this applies 
to more than one code, the code that appears earliest in the sequence of diagnosis fields is 
used. Where no alcohol attributable diagnosis is present this field will be null. Please refer to 
the supplementary table, ''Refreshed Indicator Conditions and Fractions'', on the Data 
Dictionaries page of HESonline for more information 
[http://www.hesonline.nhs.uk/Ease/servlet/ContentServer?siteID=1937&categoryID=289].', N'Diagnosis', N'6an', N'2002-2003 onwards', N'Derived by rule 1230', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1634, N'Principal alcohol related fraction', N'Alcfrac', N'Indicates the highest alcohol attributable fraction within the episode based on the principal 
alcohol related diagnosis. Please refer to the supplementary table, ''Refreshed Indicator 
Conditions and Fractions'', on the Data Dictionaries page of HESonline for more information 
[http://www.hesonline.nhs.uk/Ease/servlet/ContentServer?siteID=1937&categoryID=289].', N'Diagnosis', N'n.nn', N'2002-2003 onwards', N'Derived by rule 1230', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1635, N'Date of discharge', N'disdate', N'This field contains the date on which the patient was discharged from hospital. 
It is only present in the record for the last episode of a spell.', N'Discharges', N'dd/mm/yyyy (Date)', N'All years', N'Rules 205, 210, 220 and 223', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1636, N'Destination on discharge', N'disdest', N'This field contains a code which identifies where the patient was due to go on leaving 
hospital. In most cases they return home. 
For many patients discharge destination is the same as source of admission (admisorc).', N'Discharges', N'2n', NULL, N'Rules 205, 210, 220 and 223', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1637, N'Discharge date check flag', N'dis_cfl', N'Codes in this field indicate whether the discharge date (disdate) is valid.', N'Discharges', N'1n', NULL, N'Not applicable (derived by rules 205, 210, 220 and 223)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1638, N'Discharge ready date', N'disreadydate', N'The date that a patient was medically ready for discharge from a hospital bed, but couldn''t be 
discharged, therefore qualifying for delayed discharge payments.', N'Discharges', N'dd/mm/yyyy (Date)', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1639, N'Method of discharge', N'dismeth', N'This field contains a code which defines the circumstances under which a patient left hospital. 
For the majority of patients this is when they are discharged by the consultant. 
This field is only completed for the last episode in a spell.', N'Discharges', N'1n', NULL, N'Rules 205, 210, 220, 223 and 320', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1640, N'Bed days within the year', N'bedyear', N'This derived field provides the duration of an episode in days within the HES data year. It is 
derived from epistart (episode start date) and epiend (episode end date). 
For episodes that both start and finish in the data year, bedyear has the same value as epidur 
(episode duration). If the episode is unfinished, bedyear is calculated from epistart and the 
end of the data year. 
If epistart is before the beginning of the data year, bedyear is calculated from the start of the 
data year and epiend. If the record type is other maternity events (episode type 5 or 6), 
bedyear is null.', N'Episodes and spells', N'3n', N'All years', N'Not applicable (derived by rule 240)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1641, N'Beginning of spell', N'spelbgin', N'This derived field contains a code that defines whether the episode is the first of a spell and 
whether the spell started in the current or previous year. Other maternity events are excluded.', N'Episodes and spells', N'1n', NULL, N'Not applicable (derived by rule 1170)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1642, N'Date episode ended', N'epiend', N'This field contains the date on which a patient left the care of a particular consultant, for one 
of the following reasons: 
Discharged from hospital (includes transfers) or moved to the care of another consultant. 
A null entry either indicates that the episode was unfinished at the end of the data year, or the 
date was unknown.', N'Episodes and spells', N'dd/mm/yyyy (Date)', NULL, N'Rules 190, 200 and 203', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1643, N'Date episode started', N'epistart', N'This field contains the date on which a patient was under the care of a particular consultant. If 
a patient has more than one episode in a spell, for each new episode there is a new value of 
epistart. 
However, the admission date which is copied to each new episode in a spell will remain 
unchanged and will be equal to the episode start date of the first episode in hospital.', N'Episodes and spells', N'dd/mm/yyyy (Date)', NULL, N'Rule 30', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1644, N'Duration of spell', N'speldur', N'This derived field contains the difference in days between the admission date (admidate) and 
the discharge date (epiend) provided the discharge method (dismeth) confirms that the spell 
has finished. 
If the episode has not finished it is calculated from the end of the year and admidate.', N'Episodes and spells', N'5n', NULL, N'Not applicable (derived by rule 1180)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1645, N'End of spell', N'spelend', N'This field contains a code which defines whether the episode is the last of a spell. 
It is set for finished episodes (episode status - epistat - is 3) for general, delivery or birth 
episodes (episode type - epitype - is 1, 2 or 3) provided the discharge method (dismeth) 
confirms that the spell has finished.', N'Episodes and spells', N'1a', NULL, N'Not applicable (derived by rule 1190)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1646, N'Episode duration', N'epidur', N'This field contains the difference in days between the episode start date (epistart) and the 
episode end date (epiend). 
If the episode is unfinished epidur is set as null.', N'Episodes and spells', N'5n', NULL, N'Not applicable (derived by rule 250)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1647, N'Episode end date check flag', N'epie_cfl', N'This field validates the episode end date (epiend).', N'Episodes and spells', N'1n', NULL, N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1648, N'Episode order', N'epiorder', N'This field contains the number of the episode within the current spell. All spells start with an 
episode where epiorder is 01. 
Many spells finish with this episode, but if the patient moves to the care of another consultant, 
a new episode begins. Episode numbers increase by 1 for each new episode until the patient 
is discharged (this includes transfers to another NHS trust or primary care trust - ie the first 
episode in the new trust will have epiorder 01). 
If the same patient returns for a different spell in hospital, epiorder is again set to 01. 
Admissions are calculated by counting the number of times epiorder is 01. When studying 
long term care, remember that it is not unusual to transfer psychiatric patients from one 
hospital to another.', N'Episodes and spells', N'2n', NULL, N'Rules 130, 140 and 320', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1649, N'Episode start date check flag', N'epis_cfl', N'This field validates the episode start date (epistart).', N'Episodes and spells', N'1n', NULL, N'Not applicable (derived by rule 30)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1650, N'Episode status', N'epistat', N'This field tells you whether the episode had finished before the end of the HES data-year (ie 
whether the episode was still ''live'' at midnight on 31 March). 
For example, if a patient was admitted on 25 March 2005 and was not discharged (or 
transferred to the care of another consultant) until 4 April 2005, there will be a record 
describing the unfinished episode (episode status = 1) in the 2004-05 data, and a separate 
record describing the finished episode (episode status = 3) in the 2005-06 data. 
Because hospital providers are advised not to include clinical data (diagnosis and operation 
codes) in unfinished records, these are normally excluded from analyses. 
Also, if unfinished episodes are included in time series analyses - where data for more than 
one year is involved - there is a danger of counting the same episode twice.', N'Episodes and spells', N'1n', NULL, N'Rules 170 and 180', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1651, N'Episode type', N'epitype', N'This field contains a code that defines the type of episode, so that groups of similar episodes 
can be formed.', N'Episodes and spells', N'1n', NULL, N'Rules 150 & 160', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1652, N'Hospital provider spell number', N'provspno', N'Hospital provider spell number. A number to provide a unique identifier for each Hospital 
Provider Spell for a Health Care Provider.', N'Episodes and spells', N'12an', N'From 1997-98', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1653, N'Ward type at start of episode', N'wardstrt', N'This field contains a code that defines the characteristics of a ward. The code has six parts: 
AABCDEF.', N'Episodes and spells', N'7n', N'From 1997-98 until 31 March 2001', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1654, N'Cancer network', N'cannet', N'The cancer network that each postcode falls within. Further information on Cancer Network 
can be found on the Department of Health website 
[http://www.dh.gov.uk/en/Healthcare/NationalServiceFrameworks/Cancer/DH_4068463].', N'Geographical', N'3an', N'From 2008-09 onwards', N'Not applicable (derived from postcode)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1655, N'Cancer registry', N'canreg', N'The cancer registry that each postcode falls within. Further information on Cancer Registries 
can be found on the Department of Health website 
[http://www.dh.gov.uk/en/Healthcare/NationalServiceFrameworks/Cancer/DH_4068586].', N'Geographical', N'5an', N'From 2008-09 onwards', N'Not applicable (derived from postcode)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1656, N'Census Output Area, 2001', N'Oacode', N'Census Output Areas (OAs) are small geographical areas that cover similar population sizes, 
according to the 2001 census, and are as socially homogenous as possible. 
There are 165,665 Census Output Areas in England. The first six characters of this derived 
field represent the 2003 statistical ward. The Census output area, 2001 (oacode) field 
contains sensitive data. 
Access to it requires the approval of the Database Monitoring Sub-Group (DMSG).', N'Geographical', N'10an', N'From 2003-04 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1657, N'Census Output Area, 2001 (6 character)', N'oacode6', N'A derived field showing the six-character ward identifier contained in the Census Output Area 
data. 
The structure is CCDDWW.', N'Geographical', N'6an', NULL, N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1658, N'County of residence', N'rescty', N'This field contains a code that defines the county of residence of the patient. It is derived from 
the patient''s postcode in the field homeadd.', N'Geographical', N'2n', NULL, N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1659, N'Current electoral ward', N'currward', N'This derived field contains a code which defines the current electoral ward of the patient. It is 
derived from the patient''s postcode in the field homeadd. 
When this field is concatenated with the other local authority component, resladst, the result is 
a unique value.', N'Geographical', N'2a', NULL, N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1660, N'Electoral ward in 1981', N'ward81', N'This field contains a code that indicates the patient''s local authority and electoral ward of 
residence in 1981. It is derived from the patient''s postcode in the field homeadd. From the 
1996-1997 data year, this field becomes ward91.', N'Geographical', N'5a', NULL, N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1661, N'Electoral ward in 1991', N'ward91', N'This field contains the patient''s full frozen 1991 Census electoral ward and local authority of 
residence. It is derived from the patient''s postcode in the field homeadd.', N'Geographical', N'6a', N'1996-99 to 1998-99', N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1662, N'Electoral ward in 1998', N'ward98', N'This field contains the patient''s full frozen 1998 Census electoral ward and local authority of 
residence. It is derived from the patient''s postcode in the field homeadd.', N'Geographical', N'6a', N'1999-00 to 2000-01', N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1663, N'Government office region of residence', N'resgor', N'This derived field contains a code that defines the Government Office Region of residence of 
the patient. It is derived from the patient''s postcode in the field homeadd.', N'Geographical', N'2an', N'1996-97 onwards', N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1664, N'Government office region of treatment', N'gortreat', N'Goverment Office Region (GOR) of treatment. This field is derived from the hospital provider 
code (procode). It indicates the GOR area within which the treatment took place.', N'Geographical', N'1a', N'From 2002-03', N'Not applicable (derived by rule 1145)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1665, N'Health authority of residence', N'resha', N'Health authority (HA) of residence (contains the district health authority of residence prior to 1 
April 1996). 
This derived field contains the code for the HA in which the patient lived immediately before 
admission. 
Resha is derived from the patient''s postcode in the field homeadd. (This may not be the area 
where treatment took place (hatreat).) 
If homeadd is not recognised, resha may be derived from the health authority of residence 
notified by the hospital (har). 
From 2002-03 information relating to the strategic health authority of residence is available.', N'Geographical', N'3a', NULL, N'Not applicable - derived by the following rule: Rule 1200', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1666, N'Health authority of treatment', N'hatreat', N'This field indicates the health authority (HA) where the treatment took place. It is derived from 
the hospital provider code (procode). Health authority of treatment (contains the district health 
authority of treatment prior to 1 April 1996).', N'Geographical', N'3a', NULL, N'Not applicable (derived by rule 1145)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1667, N'Local authority district', N'resladst', N'This derived field contains a code for the patient''s county (first two characters) and local 
authority district (last two characters) of residence. It is derived from the patient''s postcode in 
the field homeadd. 
This field is used in conjunction with currward (current electoral ward) to produce a unique 
value indicating the ward within a given district where the patient resided (ie because identical 
Currward codes are allocated to many local authority districts, currward is meaningless in 
isolation). 
If the patient is resident within a Unitary Authority, the first two characters will be 00 (zero, 
zero) and the local authority component may not be useable.', N'Geographical', N'4an', NULL, N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1668, N'Local authority district in 1998', N'lad98', N'This derived field contains a code for the patient''s county (first two characters) and local 
authority district (last two characters) of residence. It is derived from the patient''s postcode 
(homeadd). 
This field is used in conjunction with currward (current electoral ward) to produce a unique 
value indicating the ward within a given district where the patient resided (ie because identical 
Currward codes are allocated to many local authority districts, currward is meaningless in 
isolation). 
If the patient is resident within a Unitary Authority, the first two characters will be 00 (zero, 
zero) and the local authority component may not be useable.', N'Geographical', N'4an', N'1999-00 to 2000-01', N'Not applicable (derived item)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1669, N'Lower Super Output Area', N'soal', N'Lower Super Output Areas are aggregations of Output Areas. There are 32,482 Lower Super 
Output Areas in England. 
The first character is either E for England or W for Wales. 
The next two characters are 01 for Lower Super Output Area and the remaining six 
characters make up the unique 6-digit tag for each zone.', N'Geographical', N'10an', NULL, N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1670, N'Middle Super Output Area', N'soam', N'Middle Super Output Areas are aggregations of Output Areas. 
The first character is either E for England or W for Wales. 
The next two characters are 02 for Middle Layer and the remaining six characters make up 
the unique 6-digit tag for each zone. There are 6,780 Middle Super Output Areas in England.', N'Geographical', N'10an', NULL, N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1671, N'Ordnance Survey grid reference', N'gridlink', N'Ordnance survey postcode grid reference. Gridlink'' is the name for a set of branded 
postcode products produced by the Gridlink Consortium (Royal Mail, Ordnance Survey (GB), 
General Register Office for Scotland (GROS), Ordnance Survey of Northern Ireland (OSNI) 
and ONS). 
The Gridlink field in HES is only available to the NHS.', N'Geographical', N'9n', N'From 2002-03 onwards', N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1672, N'Patient''s health authority of residence, provided by', N'NHS', N'The patient''s health authority of residence provided by the NHS.', N'har', N'Geographical', N'3an', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1673, N'Patient''s primary care trust of residence', N'respct', N'This derived field contains the code for the primary care trust (PCT) in which the patient lived 
immediately before admission. It is derived from the patient''s postcode in the field homeadd.', N'Geographical', N'3an', N'From 1996-97', N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1674, N'Patient''s primary care trust of residence '' historic', N'respct02', N'This derived field contains the code for the primary care trust (PCT) in which the patient lived 
immediately before admission. It is derived from the patient''s postcode in the field homeadd.', N'Geographical', N'naa or nan', NULL, N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1675, N'Patient''s primary care trust of residence '' current', N'respct06', N'This derived field contains the code for the primary care trust (PCT) in which the patient lived 
immediately before admission. It is derived from the patient''s postcode in the field homeadd.', N'Geographical', N'3an', NULL, N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1676, N'Patient''s strategic health authority of residence', N'resstha', N'This derived field contains the code for the strategic health authority (SHA) in which the 
patient lived immediately before admission. It is derived from the patient''s postcode in the 
field homeadd.', N'Geographical', N'3an', N'From 1996-97', N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1677, N'Patient''s strategic health authority of residence -', N'historic', N'This derived field contains the code for the strategic health authority (SHA) in which the 
patient lived immediately before admission. It is derived from the patient''s postcode in the 
field homeadd.', N'resstha02', N'Geographical', N'3an', N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1678, N'Patient''s strategic health authority of residence -', N'current', N'This derived field contains the code for the strategic health authority (SHA) in which the 
patient lived immediately before admission. It is derived from the patient''s postcode in the 
field homeadd.', N'resstha06', N'Geographical', N'3an', N'Not applicable (derived by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1679, N'Primary care trust area of main provider', N'pcttreat', N'This field is derived from the hospital provider code (procode). It indicates the PCT area of 
the main provider of treatment. Note that the PCT itself may be the provider of treatment. 
Note: This field was formerly known as ''Primary care trust area of treatment''.', N'Geographical', N'3an', N'From 1996-97', N'Not applicable (derived by rule 1145)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1680, N'Region of treatment', N'rotreat', N'Region of treatment (contains the Regional Health Authority of treatment prior to 1 April 
1996). This derived field is extracted from the hospital provider code (procode). 
It defines the Regional Office (RO) where the treatment took place.', N'Geographical', N'3an', NULL, N'Not applicable (derived by rule 1145)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1681, N'Regional office of residence', N'resro', N'Regional office (RO) of residence (contains the regional health authority of residence prior to 
1 April 1996). 
It contains the code for the RO in which the patient lived immediately before admission. It is 
derived from the patient''s postcode in the field homeadd.', N'Geographical', N'3an', N'From 1996-97', N'Not applicable - derived by the following rules: Rule 1200', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1682, N'Rural/Urban Indicator', N'rururb_ind', N'Describes the nature of an Output Area in terms of its morphology (hamlet, town, urban, etc) 
and context (sparse or less sparse).', N'Geographical', N'1n', NULL, N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1683, N'Site code of treatment', N'sitetret', N'This field contains a code that defines the site on which the patient was treated within an 
organisation.', N'Geographical', N'5an', N'From 1997-98', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1684, N'Strategic health authority area of treatment', N'sthatret', N'This field is derived from the hospital provider code (procode). It indicates the strategic health 
authority (SHA) area within which the treatment took place.', N'Geographical', N'3an', N'From 1996-97', N'Not applicable (derived by rule 1145)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1685, N'Super output area', N'soacode', N'Super Output Areas are aggregations of Output Areas. There are 3 types of Super Output 
Area, Lower Layer, Middle Layer, and Upper Layer. 
The first character is either E for England or W for Wales. 
The next two characters are either 01 for Lower Layer, or 02 for Middle Layer and the 
remaining six characters make up the unique 6-digit tag for each zone. There are 32,482 
Lower Layer Super Output Areas in England 
There are 6,780 Middle Layer Super Output Areas in England 
There are likely to be approximately 2,000 Upper Layer Super Output Areas in England. For 
more information about Super Output Areas see the National Statistics website.', N'Geographical', N'10an', NULL, N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1686, N'Westminster parliamentary constituency', N'pcon', N'The Westminster Parliamentary Constituency code for each postcode. Pseudo codes are 
included for Channel Islands and Isle of Man. The field will be blank for postcodes with no grid 
reference.', N'Geographical', N'3n', N'From 2008-09 onwards', N'Not applicable (derived from postcode)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1687, N'HRG version n.n (HES generated)', N'hrg_n.n', N'This HES derived field contains healthcare resource group (HRG) values. HES adds the two 
most recent versions of HRG codes to records. 
For example, a record for 2004-05 will have codes for HRG version 3.1 and HRG version 3.5.', N'Healthcare Resource Groups', N'3an', NULL, N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1688, N'Trust derived dominant procedure', N'domproc', N'Contains the dominant procedure (operation) code assigned as part of the (NHS) HRG 
derivation process and submitted to SUS.', N'Healthcare Resource Groups', N'4an, - or &', N'2001-02 to 2008-09', N'Rule 570', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1689, N'Trust derived HRG value', N'hrgnhs', N'The Trust derived HRG value as submitted to SUS takes into account the dominant grouping 
procedure (domproc) and may differ from the HES derived HRG (HRG_n.n).', N'Healthcare Resource Groups', N'3an', N'2001-02 to 2008-09', N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1690, N'SUS generated HRG', N'sushrg', N'The SUS PbR derived healthcare resource group (HRG) code (HRG4 from 2009-10) at 
Episode level.', N'Healthcare Resource Groups', N'5an', N'From 2009-10', N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1691, N'SUS generated core spell HRG', N'suscorehrg', N'The SUS PbR derived healthcare resource group (HRG) code (HRG4 from 2009-10) at Spell 
level. 
Analysing this field by episode in HES could lead to over-counting.', N'Healthcare Resource Groups', N'5an', N'From 2009-10', N'', NULL)
GO
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1692, N'SUS generated HRG version number', N'sushrgvers', N'The version number for the SUS generated HRG code (sushrg).', N'Healthcare Resource Groups', N'3an', N'From 2009-10', N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1693, N'Version no. of Trust derived HRG', N'hrgnhsvn', N'The version number for the Trust derived HRG value (hrgnhs).', N'Healthcare Resource Groups', N'3an', N'2001-02 to 2008-09', N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1694, N'Anaesthetic given during labour or delivery', N'delpren', N'This field contains a code which defines the anaesthetic or analgesic administered before and 
during labour and delivery.', N'Maternity', N'1n', NULL, N'Rule 730', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1695, N'Anaesthetic given post-labour or delivery', N'delposn', N'This field contains a code which defines the anaesthetic or analgesic administered after 
delivery.', N'Maternity', N'1n', NULL, N'Rule 730', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1696, N'Antenatal days of stay', N'antedur', N'This derived field contains the number of days between the start of the episode (epistart) and 
the date of delivery of the first baby (dobbaby).', N'Maternity', N'3n', NULL, N'Not applicable (derived by rule 800)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1697, N'Baby sequence number', N'babyseq', N'Birth sequence.', N'Maternity', N'1n', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1698, N'Baby''s age in days', N'neodur', N'This field contains the age in days of a baby admitted as a patient. It is derived from 
admission date (admidate) and date of birth (dob). If the baby is older than 27 days, neodur is 
not calculated.', N'Maternity', N'2n', NULL, N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1699, N'Birth date (baby)', N'dobbaby', N'Baby''s date of birth. This item appears for each baby on multiple birth delivery records. The 
Birth date - baby (dobbaby) field contains sensitive data. 
Access to it requires the approval of the Database Monitoring Sub-Group (DMSG).', N'Maternity', N'dd/mmyyyy (Date)', NULL, N'Rule 670', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1700, N'Birth order', N'birorder', N'The position in the sequence of births. This item appears for each baby on multiple birth 
delivery records. 
From 1996-97 the same value (1) is used for a single birth or the first born of several. Up until 
March 2002, only the first six births were recorded.', N'Maternity', N'1n or X', NULL, N'Rule 720', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1701, N'Birth weight', N'Birweit', N'This field contains the weight of the baby in grams immediately after birth. This item appears 
for each baby on multiple birth delivery records.', N'Maternity', N'4n', NULL, N'Rules 740 and 760', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1702, N'Delivery place change reason', N'delchang', N'This field contains a code that defines the reason for changing the delivery place type.', N'Maternity', N'1n', NULL, N'Rules 710 and 750', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1703, N'Delivery method', N'delmeth', N'This field contains a code which defines the method used to deliver a baby that is a 
registrable birth. 
The code is obtained from the ICD classification for delivery method. This item appears for 
each baby on multiple birth delivery records.', N'Maternity', N'1n or X', NULL, N'Rules 710 and 753', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1704, N'Delivery method derived', N'delmethd', N'A derived field providing delivery method from OPCS 3- or 4-character (where applicable) 
main operation codes.', N'Maternity', N'2n', N'From 2008-09 onwards', N'Not applicable (derived by rule 0765)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1705, N'Delivery place (actual)', N'Delplace', N'This field contains a code which defines the actual type of delivery place (The intended 
delivery place is in delintn). 
This item appears for each baby on multiple birth delivery records.', N'Maternity', N'1n', NULL, N'Rules 710 and 753', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1706, N'Delivery place (intended)', N'delinten', N'This field contains a code which defines the intended type of delivery place. The initial 
intention is designated by the General Medical Practitioner (GMP) and midwife, or by the 
GMP and hospital staff. 
The decision is normally made when the mother is assessed for delivery. The actual delivery 
place type is in delplac.', N'Maternity', N'1n', NULL, N'Rules 710 and 750', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1707, N'First antenatal assessment date', N'anasdate', N'This field contains the date when a pregnant woman was first assessed and arrangements 
were made for antenatal care. 
This is not necessarily the date when delivery arrangements were made.', N'Maternity', N'dd/mm/yyyy (Date)', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1708, N'Gestation period in weeks at first antenatal assessment', N'anagest', N'Gestation period in weeks at the date of the first antenatal assessment. This field is calculated from anadate, gestat and the dobbaby.', N'Maternity', N'2nn', NULL, N'Not applicable (derived by rule 790)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1709, N'Length of gestation', N'gestat', N'The fields contain the number of completed weeks of gestation according to the World Health 
Organization definition, which specifies time from the first day of the last menstrual period. If 
this date is not reliable, an estimate is provided. 
This item appears for each baby on multiple birth delivery records.', N'Maternity', N'2n', NULL, N'Rules 710 and 753', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1710, N'Birth status', N'birstat', N'This field contains a code which indicates whether the baby was born alive or dead (still birth). 
A still birth is a birth after a gestation period of 24 weeks (168) days where the baby shows no 
sign of life when delivered. 
This item appears for each baby on multiple birth delivery records.', N'Maternity', N'1n', NULL, N'Rules 710 and 753', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1711, N'Labour / delivery onset method', N'delonset', N'This field contains a code which defines the method used to induce (initiate) labour, rather 
than to accelerate it.', N'Maternity', N'1n', NULL, N'Rules 710 and 750', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1712, N'Mother''s age at delivery', N'matage', N'This field contains the mother''s age in whole years on the date of delivery. It is calculated 
from the mother''s date of birth and the first baby''s date of birth.', N'Maternity', N'3n', NULL, N'Not applicable (derived by rule 810)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1713, N'Mother''s date of birth', N'motdob', N'This field contains the mother''s date of birth. It appears on birth records. The Mother''s date of 
birth (motdob) field contains sensitive data. 
Access to it requires the approval of the Database Monitoring Sub-Group (DMSG).', N'Maternity', N'dd/mm/yyyy (Date)', NULL, N'Rule 690', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1714, N'Mother''s data of birth check flag', N'motdob_cfl', N'Codes in this field validate the mother''s date of birth (motdob).', N'Maternity', N'1n', NULL, N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1715, N'Neonatel level of care', N'neocare', N'This field contains a code that defines the level of care given to a new born child. (Along with 
psychiatric patient status (admistat), this field replaces the V code indicator (vind).)', N'Maternity', N'1n', N'From 1996-97', N'Rules 360 and 370', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1716, N'Number of babies', N'numbaby', N'This field contains the number of babies delivered at the end of a single pregnancy. Both live 
and stillborn babies are counted. Until 2002-03, a maximum of 6 babies could be recorded in 
HES.', N'Maternity', N'1n or X', NULL, N'Rules 710 and 750', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1717, N'Number of baby tails', N'numtailb', N'This is the number of valid baby groups on the episode record. A valid baby group is defined 
as one which has a valid birthweight and a valid delivery method. This field defaults to 1.', N'Maternity', N'1n', NULL, N'Rule 770', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1718, N'Number of previous pregnancies', N'numpreg', N'This field contains the number of previous pregnancies that resulted in a registrable birth (live 
or still born). It appears on delivery records. 
In practice, numpreg1 has often been filled with the ''Not known'' code, and the remainder 
have been left blank.', N'Maternity', N'2n', NULL, N'Rule 750', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1719, N'Postnatal stay', N'postdur', N'This derived field contains the number of days between the baby''s birth and the end of the 
finished episode. It is calculated from episode end date (epiend) and the first baby''s date of 
birth (dobbaby).', N'Maternity', N'3n', NULL, N'Not applicable (derived by rule 820)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1720, N'Resuscitation method', N'biresus', N'This field contains a code that identifies the method used to get the baby breathing normally. 
This item appears for each baby on multiple birth delivery records.', N'Maternity', N'1n', NULL, N'Rules 710 and 753', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1721, N'Sex of baby', N'sexbaby', N'This field contains a code that defines the sex of the baby. This item appears for each baby 
on multiple birth delivery records.', N'Maternity', N'1n', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1722, N'Status of person conducting delivery', N'delstat', N'This field normally provides the status of the person conducting the delivery. When a student 
delivers the baby, the code of the supervisor should be given. 
This item appears for each baby on multiple birth delivery records.', N'Maternity', N'1n', NULL, N'Rules 710 and 753', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1723, N'Well baby flag', N'well_baby_ind', N'Codes in this field indicate whether the episode relates to a well baby (a neonate receiving 
normal levels of care, usually given by a mother or mother substitute). 
Note: This field was formerly known as ''Well Baby Check Flag''.', N'Maternity', N'1a', N'All years', N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1724, N'Commissioner code', N'purcode', N'This field contains a code for the organisation commissioning the patient''s treatment. There 
are six main types of purchaser, the prevalence of each being dependent on the data year.', N'Organisation', N'5an', NULL, N'Rule 340', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1725, N'Commissioner code status', N'purval', N'A derived field that indicates whether the purchaser code (purcode) is one that is recognised 
throughout the NHS. 
If not, the code may have been agreed locally between the hospital provider and the health 
care purchaser.', N'Organisation', N'1n', N'From 1995-96', N'Not applicable (derived by rule 1150)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1726, N'Commissioner''s regional office', N'purro', N'This field contains a code which identifies the Regional Office (RO) in which the purchaser is 
located. It is derived from the purcode field. 
The current codes include those used in 1995-96 and those used subsequently. There were 
alterations to the codes from April 1996 and April 1999 to reflect changes in the regional 
organisation.', N'Organisation', N'5an', N'From 1995-96 to 2001-02', N'Not applicable (derived by rule 1150)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1727, N'Commissioner''s strategic health authority', N'purstha', N'This field contains a code which identifies the strategic health authority (SHA) in which the 
commisioner is located. It is derived from the purcode field.', N'Organisation', N'3an', N'From 2002-03', N'Not applicable (derived by rule 1155)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1728, N'Commissioning serial number', N'csnum', N'Contains the commissioning serial number (used in HES to identify OATs - out of area 
treatments). This is a number used to uniquely identify a NHS service agreement by an 
organisation acting as commissioner of patient care services.', N'Organisation', N'6an', N'From 2000-01', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1729, N'Health authority area where patient''s GP was', N'registered', N'Provides the health authority area in which the patient''s GP is registered.', N'gppracha', N'Organisation', N'3an', N'Not applicable (derived by rule 1110)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1730, N'Primary care group', N'pcgcode', N'A derived field providing the primary care group responsible for the patient.', N'Organisation', N'5an', N'From 1999-00 to 2001-02', N'Not applicable (derived by rule 1160)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1731, N'Primary care trust area where patient''s GP was', N'registered', N'This field gives details of the primary care trust area in which the patient''s GP is registered.', N'gpprpct', N'Organisation', N'3an', N'Not applicable (derived by rule 1125)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1732, N'Primary care trust of responsibility', N'pctcode', N'A derived field providing the primary care trust responsible for the patient. Commissioning 
responsibility for individual patients rests with the primary care trust (PCT) with whom the 
patient is registered. 
This means that patients with a GP in one PCT area may reside in a neighbouring or other 
area but remain the responsibility of the PCT with whom their GP of registration is associated. 
PCTs are also responsible for non-registered patients who are resident within their 
boundaries.', N'Organisation', N'3an', N'From 1997-98 to 2005-06', N'Not applicable (derived by rule 1160)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1733, N'Primary care trust of responsibility - historic', N'pctcode02', N'A derived field providing the primary care trust responsible for the patient. Commissioning 
responsibility for individual patients rests with the primary care trust (PCT) with whom the 
patient is registered. 
This means that patients with a GP in one PCT area may reside in a neighbouring or other 
area but remain the responsibility of the PCT with whom their GP of registration is associated. 
PCTs are also responsible for non-registered patients who are resident within their 
boundaries.', N'Organisation', N'3an', N'From 2006-07', N'Not applicable (derived by rule 1160)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1734, N'Primary care trust of responsibility - current', N'pctcode06', N'A derived field providing the primary care trust responsible for the patient. Commissioning 
responsibility for individual patients rests with the primary care trust (PCT) with whom the 
patient is registered. 
This means that patients with a GP in one PCT area may reside in a neighbouring or other 
area but remain the responsibility of the PCT with whom their GP of registration is associated. 
PCTs are also responsible for non-registered patients who are resident within their 
boundaries.', N'Organisation', N'3an', N'From 2006-07', N'Not applicable (derived by rule 1160)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1735, N'Provider code', N'procodet', N'This field gives a combination of 3-character and 5-character provider codes. 
Procodet enables you to view a combined list of codes, and related data, from: 
1. Primary care trusts (3 character, beginning with 5) 
2. NHS trusts (3 character, beginning with R. Trusts with associated treatment centres will 
have an ''- X'' following their code) 
3. NHS trust treatment centres (5 character 
listed separately to the NHS trusts) 
4. Independent providers (5 character, beginning with 8) 
5. Independent sector healthcare providers (5 character, beginning with N) 
For 3-character codes only see procode (provider code - 3 character) and for 5-character 
codes only see procode (provider code).', N'Organisation', N'5an', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1736, N'Provider code - 3 character', N'procode3', N'A provider code is a unique code that identifies an organisation acting as a health care 
provider. 
The code is managed by the National Administrative Codes Service (NACS) and supports the 
identification of organisations exchanging information within the NHS. 
Procode3 contains only the first three characters (the organisation code) and can be used to 
identify an individual provider (eg NHS Trust or PCT).', N'Organisation', N'3an', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1737, N'Provider code - 5 character', N'procode', N'A provider code is a unique code that identifies an organisation acting as a health care 
provider. 
The code is managed by the National Administrative Codes Service (NACS) and supports the 
identification of organisations exchanging information within the NHS. 
Procode contains the complete NHS provider code (ie organisation code plus site code).', N'Organisation', N'5an', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1738, N'Provider type', N'protype', N'Healthcare provider type.', N'Organisation', N'Various', NULL, N'Not applicable (derived from reference data)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1739, N'Regional office area where patient''s GP was registered', N'gppracro', N'Provides the Regional Office area in which the patient''s GP is registered.', N'Organisation', N'3an', N'From 2002-03', N'Not applicable (derived by rule 1120)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1740, N'Strategic health authority area where patient''s GP was', N'registered', N'This field gives the stategic health authority (SHA) area in which the patient''s GP is 
registered.', N'gpprstha', N'Organisation', N'3an', N'Not applicable (derived by rule 1125)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1741, N'Administrative & legal status of patient', N'category', N'Many NHS hospitals have private wards where private patients may use the accommodation 
and services of the hospital provider. 
Some hospitals also provide amenity beds, usually located in small side wards for which a 
charge is made for the accommodation. 
Both of these categories of patient are defined by the NHS Act of 1977. Any categories of 
patient, whether NHS, private or amenity patients, can be formally detained under the 
provisions of the Mental Health Act 1983 and other legislation. 
Most patients in NHS hospitals or hospital units will come under category 10 (see below). 
* Codes 13, 23 and 33 were introduced at the start of the 1994-95 HES year (1 April 1995)', N'Patient', N'2n', N'Until 31 March 2002', N'Not applicable (derived by the Secondary Uses Service from 
Administrative category and Legal Status Classification)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1742, N'Administrative category', N'admincat', N'Administrative category on admission.', N'Patient', N'2n', N'From 2000-01', N'Rule 125 (from 2002-03 onwards)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1743, N'Admin category at start of episode', N'admincatst', N'The patient''s administrative category at the start of each episode of care. 
This may change during a spell as the patient may, for example, opt to change from NHS to 
private health care.', N'Patient', N'2an', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1744, N'Admission episode flag', N'admiflag', N'-', N'Patient', N'1a', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1745, N'Age at activity date', N'activage', N'The patient''s age, in years, at the time of activity, such as admission, discharge or birth.', N'Patient', N'3n', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1746, N'Age at end of episode', N'endage', N'This derived field contains the patient''s age in whole years at the end of a finished episode 
(from 1 to 115 (1990-91 to 1994-95) and from 1 to 120 (1995-96 onwards). 
It is calculated from the episode end date (epiend) and the patient''s date of birth (dob). 
This field is only provided for finished episodes (episode status - epistat - is 3) and for 
general, delivery or birth records (episode type - epitype - is 1, 2 or 3). 
For patients under one year old, special codes apply.', N'Patient', N'4n', NULL, N'Not applicable (derived by rule 280)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1747, N'Age at start of episode', N'startage', N'This derived field, calculated from episode start date (epistart) and date of birth (dob), 
contains the patient''s age in whole years (From 1 to 115 (1990-91 to 1994-95) and from 1 to 
120 (1995-96 onwards)). 
For patients under 1 year old, special codes in the range 7001 to 7007 apply.', N'Patient', N'4n', NULL, N'Not applicable (derived by rule 290)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1748, N'Age on admission', N'Admiage', N'A patient''s age, in years, at the date of admission.', N'Patient', N'3n', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1749, N'Age of baby in days', N'neodur', N'This field contains the age in days of a baby admitted as a patient. It is derived from 
admission date (admidate) and date of birth (dob). 
If the baby is older than 27 days, neodur is not calculated.', N'Patient', N'2n', NULL, N'Not applicable (derived by rule 300)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1750, N'Date of birth - patient', N'dob', N'This field contains the patient''s date of birth. For most enquiries the field startage (age at start 
of episode) is used. 
The Date or birth - patient (dob) field contains sensitive data. Access to it requires the 
approval of the Database Monitoring Sub-Group (DMSG).', N'Patient', N'dd/mm/yyyy (Date)', NULL, N'Rule 20', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1751, N'Date of birth check flag - patient', N'dob_cfl', N'Validation of patient''s date of birth.', N'Patient', N'1n', NULL, N'Not applicable (derived by rule 20)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1752, N'Discharge episode flag', N'disflag', N'', N'Patient', N'1a', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1753, N'Ethnic category', N'ethnos', N'This field contains a code that specifies some ethnic groups and some nationalities. It was 
introduced from the 1995-96 data year. 
From April 2001 the codes were changed to conform to the 2001 census classification. 
However, HES continued to accept the old codes as well as the new codes for the 2001-02 
and 2002-03 data years. 
Ethnic Category has been mandatory for Admitted Patient Care Commissioning Dataset 
central returns since 1995. However birth episodes, and other CDS types have been 
optional. 
From April 2009 Ethnic Category will be mandatory for all CDS types. I.e. to include: birth 
episodes; unfinished birth episodes; other birth event types; Out Patient CDSs and Accident 
and Emergency CDSs. 
Note: ''Z '' not stated'' means that the person had been asked and had declined either 
refusing to provide this information, or a genuine inablility to choose. ''X '' Not known'' means 
that the person has not been asked or the patient was not in a condition to be asked. E.g. 
unconscious.', N'Patient', N'1n or X', NULL, N'Rule 10', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1754, N'Finished consultant episode flag', N'fceflag', N'-', N'Patient', N'1a', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1755, N'In year flag', N'inyrflag', N'-', N'Patient', N'1a', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1756, N'Legal category of patient', N'leglcat', N'The legal category of all formally and informally detained patients on admission. An informally 
detained patient is one who is not formally detained, but has been in hospital for a year or 
more in the care of a consultant in the psychiatric specialties. 
This item is required for all admissions to psychiatric specialties. The Legal category of 
patient (lelcat) field contains sensitive data. 
Access to it requires the approval of the Database Monitoring Sub-Group (DMSG).', N'Patient', N'2n', N'From 2000-01', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1757, N'Legal status classification code at start of episode', N'leglstatst', N'Required for all patients with a hospital provider spell that includes the care of a consultant in 
a psychiatric specialty or who have been discharged from such a spell and are receiving 
supervised aftercare under the provisions of the Mental Health Act 1995.', N'Patient', N'2an', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1758, N'Local patient identifier', N'lopatid', N'This field contains the number used to identify a patient within a health care provider. It may 
be different from the patient''s case note number and may be assigned automatically by the 
hospital''s patient administration system. 
The Local patient identifier (lopatid) field contains sensitive data. Access to it requires the 
approval of the Database Monitoring Sub-Group (DMSG).', N'Patient', N'10n', N'From 1997-98', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1759, N'NHS number', N'newnhsno', N'This field contains the NHS Number of the patient, which is the primary identifier of a person 
registered for health care it is unique. 
Records for babies under six weeks of age and for patients admitted through accident and 
emergency tend to have null entries for this field. The NHS Number (newnhsno) field contains 
sensitive data. 
Access to it requires the approval of the Database Monitoring Sub-Group (DMSG).', N'Patient', N'10n', N'From 1997-98', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1760, N'Patient ID - HES generated (original)', N'hesid_orig', N'Uniquely identifies a patient across all data years. It is generated by matching records for the 
same patient using a combination of NHS Number and local patient identifier, plus the 
patients'' postcode, sex and date of birth.', N'Patient', N'10n', N'From 1997-98', N'Not applicable (derived data)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1761, N'Patient identifier - HES generated', N'pseudo_hesid', N'This field uniquely identifies a patient across all data years. It is generated by matching 
records for the same patient using a combination of NHS Number, local patient identifier, 
postcode, sex and date of birth. 
Customers who request an extract will receive a unique version of the pseudo_hesid called 
the extract_hesid. 
Pseudo_hesid supercedes hesid.', N'Patient', N'32an', NULL, N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1762, N'Postcode district of patient''s residence', N'postdist', N'Contains the outward portion of the patient''s postcode (ie all characters to the left of the 
space). 
The code ZZ99 indicates the postcode was either unavailable, or that the patient did not have 
one (eg because they were normally resident abroad).', N'Patient', N'4an', NULL, N'Not applicable (derived from homeadd by rule 1200)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1763, N'Postcode of patient', N'homeadd', N'This field normally contains the patient''s home postcode. However, if a patient is away from 
home for long periods, such as in a university hall of residence, the postcode of their typical 
residence is used instead. If the postcode contains fewer than eight characters, spaces are 
placed between the two parts of the postcode so that the second part always starts at the 
sixth character position. 
The Postcode of patient (homeadd) field contains sensitive data. Access to it requires the 
approval of the Database Monitoring Sub-Group (DMSG).', N'Patient', N'8an', NULL, N'Rule 330', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1764, N'Sex of patient', N'sex', N'This field contains a code which defines the sex of the patient.', N'Patient', N'1n', NULL, N'Rules 50, 60 and 650', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1765, N'Duration of elective wait', N'waitdays', N'The number of days that a patient waited from the date when a decision was taken for 
treatment to when they received the treatment.', N'Patient Pathway', N'4n', N'2007-08, Quarter 3 onwards', N'Not applicable: derived field', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1766, N'Earliest reasonable date offered', N'earldatoff', N'The earliest reasonable (as defined by hospital staff where a patient accepts an offer date the 
date is deemed reasonable) appointment or admission date offered. 
Where a patient cancels an appointment or offer for admission, the earliest reasonable offer 
date for the rearranged appointment/admission will remain as the earliest reasonable offer 
date of the cancelled appointment/admission. 
Where the healthcare provider cancels and rearrange an appointment/admission date, the 
earliest reasonable offer date for the re-arranged appointment/admission will be the date of 
the earliest reasonable offer made following cancellation.', N'Patient Pathway', N'dd/mm/yyyy (Date)', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1767, N'Organisation code (patient pathway ID issuer)', N'orgpppid', N'The organisation code of the patient pathway ID issuer. 
Where Choose and Book has been used, the Organisation Code for NHS Connecting For 
Health (X09) is used.', N'Patient Pathway', N'5an', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1768, N'Patient pathway ID', N'Patpathid', N'A code that, when combined with the organisation code of either the issuer or the 
organisation receiving the service request, identifies a patient''s pathway. 
For example, the Unique Booking Reference Number of the first referral and X09 (the 
organisation code for NHS Connecting for Health).', N'Patient Pathway', N'20an', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1769, N'RTT period start date', N'rttperstart', N'The start date, for the referral to treatment period.', N'Patient Pathway', N'dd/mm/yyyy (Date)', N'From 2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1770, N'RTT period status', N'rttperstat', N'The status of an activity, or anticipated activity, for the referral to treatment period.', N'Patient Pathway', N'2n', N'From 2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1771, N'RTT period end date', N'rttperend', N'The end date, for the referral to treatment period.', N'Patient Pathway', N'dd/mm/yyyy (Date)', N'From 2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1772, N'Unique booking reference number', N'bookrefno', N'The booking reference number assigned by the Connecting for Health Choose and Book 
System when a patient accepts an appointment date, regardless of whether they 
subsequently attend or cancel the appointment. Each booking reference number is unique.', N'Patient Pathway', N'12n', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1773, N'Admission date check flag', N'adm_cfl', N'Codes in this field indicate whether the patient''s admission date is valid.', N'Period of care', N'1n', N'All years', N'Not applicable (derived by rule 35)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1774, N'Date of admission', N'admidate', N'This field contains the date the patient was admitted to hospital at the start of a hospital spell. 
Admidate is recorded on all episodes within a spell.', N'Period of care', N'dd/mm/yyyy (Date)', N'All years', N'Rule 35', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1775, N'Date of decision to admit', N'elecdate', N'This field contains the date on which a consultant, or another member of the clinical staff, 
decided to admit the patient to a hospital. 
The patient may or may not be admitted immediately. The time between elecdate and 
admidate (admission date) is known as the waiting time.', N'Period of care', N'dd/mm/yyyy (Date)', N'All years', N'Rules 40 and 45', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1776, N'Date of decision to admit check flag', N'elec_cfl', N'Codes in this field indicate whether the decision to admit date is valid.', N'Period of care', N'1n', N'All years', N'Not applicable (derived by rules 40 and 45)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1777, N'First regular day or night admission', N'firstreg', N'This field indicates whether the episode falls within a sequence of regular day and night 
admissions and, if so, whether it is the first or subsequent episode within the sequence.', N'Period of care', N'1n', N'From 2002-03', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1778, N'Method of admission', N'admimeth', N'This field contains a code which identifies how the patient was admitted to hospital. 
Admimeth is recorded on the first and also all subsequent episodes within the spell (ie where 
the spell is made up of more than one episode).', N'Period of care', N'2n', N'All years', N'Rules 65, 70 and 320', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1779, N'Source of admission', N'admisorc', N'This field contains a code which identifies where the patient was immediately prior to 
admission. 
Most patients are admitted from home, but there are some significant exceptions. 
In particular, this field differentiates between patients admitted from home and patients 
transferred from another hospital provider or institution.', N'Period of care', N'2n', N'All years', N'Rule 80', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1780, N'Waiting time', N'elecdur', N'This derived field contains the difference in days between the date on which it was decided to 
admit the patient (elecdate) and the actual admission date (admidate). 
Elecdur is only applicable where an elective admission (ie the admission method is 11, 12 or 
13) was scheduled and took place.', N'Period of care', N'4n', NULL, N'Not applicable (derived by rule 270)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1781, N'Intended management', N'intmanig', N'This field contains a code that defines what was planned to happen. The patient classification 
(classpat) defines what actually happened.', N'Period of care', N'1n', N'From 1997-98', N'Rule 120', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1782, N'Main specialty', N'mainspef', N'This field contains a code that defines the specialty under which the consultant is contracted. 
It can be compared with tretspef, the specialty under which the consultant worked.', N'Period of care', N'3n or &', NULL, N'Rule 90 and 350', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1783, N'Patient classification', N'classpat', N'This field identifies day cases, ordinary admissions, regular day and regular night attenders, 
and the special case of mothers and babies using only delivery facilities. 
Data about regular day and regular night attenders are not available for analysis prior to 
2002-03. 
Since the introduction of the NHS wide clearing service in April 1996, this field has been 
derived from related items in the Commissioning Data Set (eg intended management).', N'Period of care', N'1n', NULL, N'Not applicable (derived by rule 260)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1784, N'Treatment specialty', N'tretspef', N'This field contains a code that defines the specialty in which the consultant was working 
during the period of care. It can be compared with mainspef, the specialty under which the 
consultant is contracted. 
Prior to 1 April 1996, this data item contained the code for the sub-specialty (subspef). 
From April 2004 a new list of treatment specialities was introduced (see below). The new list 
describes the specialised service within which the patient was treated.', N'Period of care', N'3n or &', NULL, N'Rule 100', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1785, N'Date of discharge', N'disdate', N'This field contains the date on which the patient was discharged from hospital. 
It is only present in the record for the last episode of a spell.', N'Period of care', N'dd/mm/yyyy (Date)', N'All years', N'Rules 205, 210, 220 and 223', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1786, N'Destination on discharge', N'disdest', N'This field contains a code which identifies where the patient was due to go on leaving 
hospital. In most cases they return home. 
For many patients discharge destination is the same as source of admission (admisorc).', N'Period of care', N'2n', NULL, N'Rules 205, 210, 220 and 223', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1787, N'Discharge date check flag', N'dis_cfl', N'Codes in this field indicate whether the discharge date (disdate) is valid.', N'Period of care', N'1n', NULL, N'Not applicable (derived by rules 205, 210, 220 and 223)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1788, N'Method of discharge', N'dismeth', N'This field contains a code which defines the circumstances under which a patient left hospital. 
For the majority of patients this is when they are discharged by the consultant. 
This field is only completed for the last episode in a spell.', N'Period of care', N'1n', NULL, N'Rules 205, 210, 220, 223 and 320', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1789, N'Bed days within the year', N'bedyear', N'This derived field provides the duration of an episode in days within the HES data year. It is 
derived from epistart (episode start date) and epiend (episode end date). 
For episodes that both start and finish in the data year, bedyear has the same value as epidur 
(episode duration). 
If the episode is unfinished, bedyear is calculated from epistart and the end of the data year. 
If epistart is before the beginning of the data year, bedyear is calculated from the start of the 
data year and epiend. 
If the record type is other maternity events (episode type 5 or 6), bedyear is null.', N'Period of care', N'3n', N'All years', N'Not applicable (derived by rule 240)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1790, N'Beginning of spell', N'spelbgin', N'This derived field contains a code that defines whether the episode is the first of a spell and 
whether the spell started in the current or previous year. Other maternity events are excluded.', N'Period of care', N'1n', NULL, N'Not applicable (derived by rule 1170)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1791, N'Date episode ended', N'epiend', N'This field contains the date on which a patient left the care of a particular consultant, for one 
of the following reasons: 
Discharged from hospital (includes transfers) or moved to the care of another consultant. 
A null entry either indicates that the episode was unfinished at the end of the data year, or the 
date was unknown.', N'Period of care', N'dd/mm/yyyy (Date)', NULL, N'Rules 190, 200 and 203', NULL)
GO
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1792, N'Date episode started', N'epistart', N'This field contains the date on which a patient was under the care of a particular consultant. If 
a patient has more than one episode in a spell, for each new episode there is a new value of 
epistart. 
However, the admission date which is copied to each new episode in a spell will remain 
unchanged and will be equal to the episode start date of the first episode in hospital.', N'Period of care', N'dd/mm/yyyy (Date)', NULL, N'Rule 30', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1793, N'Duration of spell', N'speldur', N'This derived field contains the difference in days between the admission date (admidate) and 
the discharge date (epiend) provided the discharge method (dismeth) confirms that the spell 
has finished. 
If the episode has not finished it is calculated from the end of the year and admidate.', N'Period of care', N'5n', NULL, N'Not applicable (derived by rule 1180)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1794, N'End of spell', N'spelend', N'This field contains a code which defines whether the episode is the last of a spell. 
It is set for finished episodes (episode status - epistat - is 3) for general, delivery or birth 
episodes (episode type - epitype - is 1, 2 or 3) provided the discharge method (dismeth) 
confirms that the spell has finished.', N'Period of care', N'1a', NULL, N'Not applicable (derived by rule 1190)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1795, N'Episode duration', N'epidur', N'This field contains the difference in days between the episode start date (epistart) and the 
episode end date (epiend). 
If the episode is unfinished epidur is set as null.', N'Period of care', N'5n', NULL, N'Not applicable (derived by rule 250)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1796, N'Episode order', N'epiorder', N'This field contains the number of the episode within the current spell. 
All spells start with an episode where epiorder is 01. 
Many spells finish with this episode, but if the patient moves to the care of another consultant, 
a new episode begins. 
Episode numbers increase by 1 for each new episode until the patient is discharged (this 
includes transfers to another NHS trust or primary care trust - ie the first episode in the new 
trust will have epiorder 01). 
If the same patient returns for a different spell in hospital, epiorder is again set to 01. 
Admissions are calculated by counting the number of times epiorder is 01. 
When studying long term care, remember that it is not unusual to transfer psychiatric patients 
from one hospital to another.', N'Period of care', N'2n', NULL, N'Rules 130, 140 and 320', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1797, N'Episode start date check flag', N'epis_cfl', N'This field validates the episode start date (epistart).', N'Period of care', N'1n', NULL, N'Not applicable (derived by rule 30)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1798, N'Episode status', N'epistat', N'This field tells you whether the episode had finished before the end of the HES data-year (ie 
whether the episode was still ''live'' at midnight on 31 March). 
For example, if a patient was admitted on 25 March 2005 and was not discharged (or 
transferred to the care of another consultant) until 4 April 2005, there will be a record 
describing the unfinished episode (episode status = 1) in the 2004-05 data, and a separate 
record describing the finished episode (episode status = 3) in the 2005-06 data. 
Because hospital providers are advised not to include clinical data (diagnosis and operation 
codes) in unfinished records, these are normally excluded from analyses. 
Also, if unfinished episodes are included in time series analyses - where data for more than 
one year is involved - there is a danger of counting the same episode twice.', N'Period of care', N'1n', NULL, N'Rules 170 & 180', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1799, N'Episode type', N'epitype', N'This field contains a code that defines the type of episode, so that groups of similar episodes 
can be formed.', N'Period of care', N'1n', NULL, N'Rules 150 & 160', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1800, N'Hospital provider spell number', N'provspno', N'Hospital provider spell number. A number to provide a unique identifier for each Hospital 
Provider Spell for a health care provider.', N'Period of care', N'12an', N'From 1997-98', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1801, N'Ward type at start of episode', N'wardstrt', N'This field contains a code that defines the characteristics of a ward. The code has six parts: 
AABCDEF.', N'Period of care', N'7n', N'From 1997-98 until 31 March 2001', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1802, N'Code of GP practice', N'gpprac', N'Code of GP practice (registered GMP). This field was introduced for the 1997-98 data year. It 
contains a code which defines the practice of the patient''s registered GP. It allows the GP to 
be notified about treatment given to the patient. 
The registered GP may not be the same as the referring GP.', N'Practitioner', N'6an', N'From 1997-98', N'Rule 440', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1803, N'Code of GP practice (pseudonymised)', N'pgpprac', N'A pseudonymised version of the code of a patient''s registered GP practice (registered GMP). 
Please note that the registered GP may not be the same as the referring GP (see preferrer). 
The code of GP practice (gpprac) field contains the actual practice code.', N'Practitioner', N'16an', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1804, N'Code of patient’s registered or referring general medical practitioner', N'reggmp', N'This is normally the code of the general medical practitioner with whom the patient is registered.This field contains sensitive data. Access to it requires the approval of the Database Monitoring Sub-Group (DMSG).', N'Practitioner', N'8an', N'From 1997-98', N'Rule 430', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1805, N'Pseudonymised code of patient''s registered or referring general medical practitioner', N'preggmp', N'A pseudonymised version of the code of the patient''s registered or referring general medical practitioner. The Code of patient''s registered or referring general medical practitioner (reggmp) field contains the actual codes. However, it is a sensitive field that requires the approval of the Database Monitoring Sub-Group before you can be given access to it.', N'Practitioner', N'16an', NULL, NULL, NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1806, N'Consultant code', N'consult', N'The GMC code for the consultant, which identifies the consultant as an individual. Midwife 
and GP episodes are identified by a special code. 
The Consultant code (consult) field contains sensitive data. Access to it requires the approval 
of the Database Monitoring Sub-Group (DMSG).', N'Practitioner', N'8an', N'From 1997-98', N'Rules 420', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1807, N'Pseudonymised consultant team code', N'pconsult', N'A pseudonymised version of the General Medical Council (GMC) code for the consultant. The 
consultant code (consult) field contains the actual GMC code. 
However, it is a sensitive field that requires the approval of the Database Monitoring Sub-
Group before you can be given access to it.', N'Practitioner', N'16an', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1808, N'Referrer code', N'referrer', N'The code for the person referring the patient. This may be the GMC code for the consultant, 
or the code that defines the practice of the patient''s registered GMP or GDP. 
This field contains sensitive data. Access to it requires the approval of the Database 
Monitoring Sub-Group (DMSG).', N'Practitioner', N'8an', N'From 1997-98', N'Rule 410', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1809, N'Pseudonymised referrer code', N'preferrer', N'A pseudonymised version of the code of the person referring the patient. The person referring 
patient (referrer) field contains the actual codes. 
However, it is a sensitive field that requires the approval of the Database Monitoring Sub-
Group before you can be given access to it.', N'Practitioner', N'16an', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1810, N'Referring organisation code', N'referorg', N'The organisation code of the organisation from which the referral is made, such as GP 
practice or NHS trust. 
The referring organisation code (referorg) field contains sensitive data. Access to it requires 
the approval of the Database Monitoring Sub-Group (DMSG).', N'Practitioner', N'6an', N'From 2002-03', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1811, N'Age at psychiatric census date', N'censage', N'This field is calculated from date of birth (dob) and the date of the psychiatric census (31 
March every year). 
It is only calculated for psychiatric census records 
if the episode type is not for a formally detained patient (epitype is not 4) or one that was 
admitted more than one year previously, censage is null. The maximum permitted value is 
120 years.', N'Psychiatric', N'3n', NULL, N'Not applicable (derived by rule 880)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1812, N'Carer support indicator', N'carersi', N'This field contains a code which states whether carer support is available to the patient at 
home or other normal residence. 
This does not include any paid support or support from a voluntary organisation unless the 
patient is normally resident in a nursing home, group home or residential care home.', N'Psychiatric', N'2n', N'From 1997-98', N'Rule 400', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1813, N'Date detention commenced', N'detndate', N'For patients under a detention order at the date of the census, this field contains the date at 
which the first order commenced in the current continuous period of detention. 
Where the detention order is held by a hospital other than where the patient is at the date of 
the census, the latter is responsible for obtaining information relating to the detention order, 
and submitting the data.', N'Psychiatric', N'dd/mm/yyyy (Date)', NULL, N'Rule 110', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1814, N'Date detention commenced check flag', N'det_cfl', N'Validation of date detention commenced.', N'Psychiatric', N'1n', NULL, N'Not applicable (derived by rule 110)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1815, N'Detention category', N'detncat', N'Indicates the legislation under which the patient was detained. 
The detention category (detncat) field contains sensitive data. Access to it requires the 
approval of the Database Monitoring Sub-Group (DMSG).', N'Psychiatric', N'1n', N'From 1999-00', N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1816, N'Duration of care to psychiatric census date', N'cendur', N'Duration of care in days to the psychiatric census date. 
This field is calculated from admidate (admission date) and the date of the psychiatric census 
(31 March every year). The maximum permitted value is 29,200 days (approximately 80 
years).', N'Psychiatric', N'5n', NULL, N'Not applicable (derived by rule 870)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1817, N'Duration of detention', N'detdur', N'This derived field contains the number of days between the date the current detention 
commenced (detndate) and the date of the psychiatric census (31 March of cendate). 
The maximum period is 29,200 days (approximately 80 years).', N'Psychiatric', N'5n', NULL, N'Not applicable (derived by rule 890)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1818, N'Legal group of patient', N'legalgpa', N'This field contains a code that allocates the legal status of a patient to one of eight groups. 
(An aggregation of legal status of a patient on admission, leglcat.) 
The legal group of patient (legalgpa) field contains sensitive data. Access to it requires the 
approval of the Database Monitoring Sub-Group (DMSG).', N'Psychiatric', N'1n', N'From 2002-03', N'Not applicable (derived by rule 1135)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1819, N'Legal group of patient (psychiatric)', N'legalgpc', N'Legal group of patient, an aggregation of legal status of a patient on psychiatric census date, 
leglstat. 
This field contains a code that allocates the legal status of a patient to one of eight groups. 
This field contains sensitive data. Access to it requires the approval of the Database 
Monitoring Sub-Group (DMSG).', N'Psychiatric', N'1n', N'From 2002-03', N'Not applicable (derived by rule 895)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1820, N'Legal status classification', N'leglstat', N'This field contains a code which defines the legal status of all formally and informally detained 
patients at the date of the census. 
An informally detained patient is one who is not formally detained, but has been in hospital for 
a year or more in the care of a consultant in the psychiatric specialties. It is only for unfinished 
records of of episode type 4. 
 The Legal status classification (leglstat) field contains sensitive data. Access to it requires the 
approval of the Database Monitoring Sub-Group (DMSG).', N'Psychiatric', N'2n', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1821, N'Marital status (psychiatric)', N'marstat', N'This field contains a code that defines a patient''s marital status where the consultant''s 
specialty (mainspef) is one of the psychiatric specialties. 
Although the numerical codes were retired on 1/10/2006, these are still flowing so both sets of 
codes are seen.', N'Psychiatric', N'1an', NULL, N'Rule 355', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1822, N'Mental category', N'mentcat', N'This field contains a code which defines the mental categories of a patient in accordance with 
the designations in the Mental Health Act 1983. 
A patient should be included in only one mental category. If a patient has been assigned to 
more than one mental category, mental illness takes precedence over the others, and mental 
impairment or severe mental impairment takes precedence over psychopathic disorder.', N'Psychiatric', N'1n', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1823, N'Psychiatric history on admission', N'admistat', N'This field contains a code which identifies previous psychiatric care for psychiatric patients. 
It applies only to patients admitted or transferred to a consultant in one of the psychiatric 
specialties during a spell in hospital. It is recorded for the first such consultant episode but not 
for subsequent psychiatric consultant episodes or any non-psychiatric episodes. 
This field is used to indicate the turnover for psychiatric patients, and identify first time 
psychiatric admissions and re-admissions. Where a patient has a history of admission to 
several hospital providers, priority is given to the current hospital provider (code 1), regardless 
of whether the preceding admission was to the same hospital provider. 
This field replaces special (UK NHS specific) diagnosis codes commencing U69 (1 April 1989 
to 31 March 1995) and U51 (1 April 1995 to 31 march 1996), and also the HES derived V 
code indicator data item.', N'Psychiatric', N'1n', N'From 1996-97', N'Rule 380', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1824, N'Status of patient included in psychiatric census', N'censtat', N'This field contains a code which defines the legal status of the patient. It is derived from legal 
status (leglstat) and the length of stay recorded for the current spell.', N'Psychiatric', N'1n', NULL, N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1825, N'V code indicator', N'vind', N'This derived field contains a code that indicates whether any of the diagnosis fields (diag_01 
to diag_07) contains a valid V code (see diag_nn). 
For 1995-1996 only, U codes replaced the V codes. Although classed as psychiatric data, 
values 1 to 3 indicate the level of neonatal care for a patient aged under 29 days. 
From 1996-97 this field was replaced by neocare and admistat.', N'Psychiatric', N'1n', NULL, N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1826, N'Ward type at psychiatric census date', N'cenward', N'This field contains a code which defines the characteristics of a ward. The code has six parts: 
AABCDEF.', N'Psychiatric', N'7n', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1827, N'IMD Barriers to Housing and Service Domain', N'imd04hs', N'The Index of Multiple Deprivation (IMD) is a measure of multiple deprivation at Super Output 
Area level. 
The IMD has seven domains, one of which is the Barriers to Housing and Services Domain. 
The purpose of the Barriers to Housing and Services domain is to measure barriers to 
housing and key local services. This version of the Index was first published in 2004. 
See The English Indices of Deprivation 2004: Summary (revised) report 
[http://www.communities.gov.uk/documents/communities/pdf/131206.pdf] for further details.', N'Socio-economic', N'4n', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1828, N'IMD Crime Domain', N'imd04c', N'The Index of Multiple Deprivation (IMD) is a measure of multiple deprivation at Super Output 
Area level. 
The IMD has seven domains, one of which is the Crime Domain. The purpose of the Crime 
domain is to measure the incidence of recorded crime for four major crime themes: 
1. burglary 
2. theft 
3. criminal damage 
4. violence 
This version of the Index was first published in 2004. 
See The English Indices of Deprivation 2004: Summary (revised) report 
[http://www.communities.gov.uk/documents/communities/pdf/131206.pdf] for further details.', N'Socio-economic', N'3n', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1829, N'IMD Decile Group', N'imd04_decile', N'This field uses the IMD Overall Ranking to identify which one of ten groups a Super Output 
Area belongs to, from most deprived through to least deprived. 
This IMD version was first published in 2004. 
See The English Indices of Deprivation 2004: Summary (revised) report 
[http://www.communities.gov.uk/documents/communities/pdf/131206.pdf] for further details.', N'Socio-economic', N'20an', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1830, N'IMD Education Training and Skills Domain', N'imd04ed', N'The Index of Multiple Deprivation (IMD) is a measure of multiple deprivation at Super Output 
Area level. 
The IMD has seven domains, one of which is the Education, Skills and training Domain. The 
purpose of the Education, Skills and training domain is to capture the extent of deprivation in 
terms of education, skills and training in a local area. 
This version of the Index was first published in 2004. 
See The English Indices of Deprivation 2004: Summary (revised) report 
[http://www.communities.gov.uk/documents/communities/pdf/131206.pdf] for further details.', N'Socio-economic', N'4n', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1831, N'IMD Employment Deprivation Domain', N'imd04em', N'The Index of Multiple Deprivation (IMD) is a measure of multiple deprivation at Super Output 
Area level. 
The IMD has seven domains, one of which is the Employment Deprivation Domain. 
This domain measures employment deprivation conceptualised as involuntary exclusion of 
the working age population from the world of work. 
This version of the Index was first published in 2004. 
See The English Indices of Deprivation 2004: Summary (revised) report 
[http://www.communities.gov.uk/documents/communities/pdf/131206.pdf] for further details.', N'Socio-economic', N'3n', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1832, N'IMD Health and Disability Domain', N'imd04hd', N'The Index of Multiple Deprivation (IMD) is a measure of multiple deprivation at Super Output 
Area level. 
The IMD has seven domains, one of which is the Health Deprivation and Disability Domain. 
The purpose of the Health deprivation and disability domain is to identify areas with relatively 
high rates of: 
1. premature deaths 
2. impaired quality of life, due to poor health 
3. people with disabilities 
This version of the Index was first published in 2004. 
See The English Indices of Deprivation 2004: Summary (revised) report 
[http://www.communities.gov.uk/documents/communities/pdf/131206.pdf] for further details.', N'Socio-economic', N'3n', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1833, N'IMD Income Affecting Children Domain', N'imd04ic', N'The Index of Multiple Deprivation (IMD) is a measure of multiple deprivation at Super Output 
Area level. 
The IMD has seven domains, one of which is the Income Deprivation Domain. The Income 
Deprivation Affecting Children Index is a sub-set of the Income Deprivation Domain. 
The Index contains the percentage of a Super Output Area''s children under 16 who were 
living in families receiving specific financial support, such as Income Support or Job Seeker''s 
Allowance. 
This version of the Index was first published in 2004. 
See The English Indices of Deprivation 2004: Summary (revised) report 
[http://www.communities.gov.uk/documents/communities/pdf/131206.pdf] for further details.', N'Socio-economic', N'3n', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1834, N'IMD Income Affecting Adults Domain', N'imd04ia', N'The Index of Multiple Deprivation (IMD) is a measure of multiple deprivation at Super Output 
Area level. 
The IMD has seven domains, one of which is the Income Deprivation Domain. The Income 
Deprivation Affecting Older People Index is a sub-set of the Income Deprivation Domain. The 
Index contains the percentage of a Super Output Area''s population aged 60 and over who are 
claiming Income Support or Job Seeker''s Allowance. 
This version of the Index was first published in 2004. 
See The English Indices of Deprivation 2004: Summary (revised) report 
[http://www.communities.gov.uk/documents/communities/pdf/131206.pdf] for further details.', N'Socio-economic', N'3n', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1835, N'IMD Income Domain', N'imd04i', N'The Index of Multiple Deprivation (IMD) is a measure of multiple deprivation at Super Output 
Area level. 
The IMD has seven domains, one of which is the Income Deprivation Domain. The purpose of 
this Domain is to capture the proportions of the population experiencing income deprivation in 
an area. 
This version of the Index was first published in 2004. 
See The English Indices of Deprivation 2004: Summary (revised) report 
[http://www.communities.gov.uk/documents/communities/pdf/131206.pdf] for further details.', N'Socio-economic', N'3n', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1836, N'IMD Living Environment Domain', N'imd04le', N'The Index of Multiple Deprivation (IMD) is a measure of multiple deprivation at Super Output 
Area level. 
The IMD has seven domains, one of which is the Living Environment domain. The Living 
Environment domain focuses on deprivation with respect to the characteristics of the living 
environment. 
This version of the Index was first published in 2004. 
See The English Indices of Deprivation 2004: Summary (revised) report 
[http://www.communities.gov.uk/documents/communities/pdf/131206.pdf] for further details.', N'Socio-economic', N'4n', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1837, N'IMD Overall Rank', N'imd04rk', N'The IMD overall ranking is made by combining the seven IMD Domain scores using the 
following weights: 
- Income (22.5%) 
- Employment (22.5%) 
- Health Deprivation and Disability (13.5%) 
- Education, Skills and Training (13.5%) 
- Barriers to Housing and Services (9.3%) 
- Crime (9.3%) 
- Living Environment (9.3%) 
The SOA (Super Output Area) with a rank of 1 is the most deprived, and 32482 the least 
deprived, on this overall measure. 
This IMD version was first published in 2004. 
See The English Indices of Deprivation 2004: Summary (revised) report 
[http://www.communities.gov.uk/documents/communities/pdf/131206.pdf] for further details.', N'Socio-economic', N'5n', NULL, N'', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1838, N'CDS extract date', N'cdsextdate', N'CDS extract date.', N'System', N'dd/mm/yyyy (Date)', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1839, N'CDS version number', N'cdsversion', N'The version of the commissioning data set (CDS) being used.', N'System', N'6an', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1840, N'CDS protocol identifier', N'cdsverprotid', N'CDS Protocol ID.', N'System', N'3an', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1841, N'CDS unique identifier', N'cdsuniqueid', N'CDS unique identifier.', N'System', N'35an', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1842, N'Combined grossing factor', N'gross_b', N'This field contains a value, calculated to four decimal places, that combines administrative 
(coverage) grossing (the value contained in data item gross_a) and clinical grossing. Clinical 
grossing compensates for the under counting of diagnoses or operations that occurs where 
cases contain a not known diagnosis code. 
The diagnostic data in a predefined group is analysed to ascertain the proportion of records 
that do not have a valid primary diagnosis. This shortfall in diagnostic coding is used to 
calculate a compensating factor. 
The clinical factor is multiplied by the value in gross_a to produce the combined grossing 
factor, gross_b. The default value for this field is 1.0000. It is overwritten when clinical 
grossing is selected.', N'System', N'7n', NULL, N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1843, N'Coverage grossing factor', N'gross_a', N'This field contains a value that compensates for missing or additional HES records. 
The number of finished HES records in a predefined group are compared with the number for 
the same group reported from another source (currently the HES Activity Count). 
The ratio between the two provides a correction factor that can be applied to HES data. The 
default value for this field is 1.0000.', N'System', N'7n', NULL, N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1844, N'Date data received', N'subdate', N'Date on which the data used to generate the HES record was received by the Secondary 
Uses Service (or the NHS-Wide Clearing Service (NWCS) prior to December 2006).', N'System', N'dd/mm/yyyy (Date)', N'From 2000-01', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1845, N'Ethnic category (audit version)', N'ethrawl', N'Ethnic category is supplied by the trusts as a two-character field. The left-hand character 
should contain the national code. A copy of the raw data found in the left hand character is 
held in ethraw.', N'System', N'1an', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1846, N'Ethnic character (audit version)', N'ethraw', N'Ethnic character is supplied by the trusts as a two-character field. Ethraw contains the left-
hand character. 
The right hand character being available for local use. A copy of the raw data found in the 
right hand character is held in ethrawl.', N'System', N'1a', NULL, N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1847, N'NHS number status indicator', N'nhsnoind', N'Codes in this field indicate whether the patients'' NHS Number is present, and if it is verified. If 
the NHS Number is absent, the indicator gives the reason why.', N'System', N'2n', N'From 2002-03', N'None', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1848, N'Origin of primary care group', N'pcgorig', N'This derived field indicates the basis on which the primary care group (PCG) code was 
assigned.', N'System', N'1n', N'From 1999-00 to 2005-06', N'Not applicable (derived by rule 1160)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1849, N'Origin of primary care trust of responsibility', N'pctorig', N'This derived field indicates the basis on which the primary care trust (PCT) of responsibility 
code was assigned.', N'System', N'1n', N'From 1997-98 to 2005-06', N'Not applicable (derived by rule 1160)', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1850, N'Origin of primary care trust of responsibility - historic', N'pctorig02', N'This derived field indicates the basis on which the primary care trust (PCT) of responsibility 
code was assigned.', N'System', N'1n', N'From 2006-07', N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1851, N'Origin of primary care trust of responsibility - current', N'pctorig06', N'This derived field indicates the basis on which the primary care trust (PCT) of responsibility 
code was assigned.', N'System', N'1n', N'From 2006-07', N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1852, N'Patient identifier (HES generated) - basis of match', N'matchid', N'This field indicates the basis on which the HES ID was allocated.', N'System', N'1n', N'From 1997-98', N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1853, N'Record identifier', N'epikey', N'This is a record identifier that is created by the HES system. The eight digits store a decimal 
number.', N'System', N'8n', NULL, N'Not applicable', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1854, N'SUS loaded staging date', N'suslddate', N'The date that the data was loaded into the SUS staging system.', N'System', N'dd/mm/yyyy (Date)', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1855, N'SUS record id', N'susrecid', N'SUS generated record identifier.', N'System', N'14n', N'2007-08, Quarter 3 onwards', N'Data not cleaned', NULL)
INSERT [dbo].[HES_FieldDefinitions] ([FieldId], [HES_FieldName], [FieldName], [Description], [Class], [LengthFormat], [Availability], [DataCleaning], [IsCategorical]) VALUES (1856, N'SUS generated Spell ID', N'susspellid', N'SUS generated Spell ID', N'System', N'10n', N'From 2009-10', N'Data not cleaned', NULL)
