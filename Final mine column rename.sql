UPDATE Column_Rename
SET Column_New='mine_id'
WHERE Column_Old='msha_Mine_mine_id';

UPDATE Column_Rename
SET Column_New='curr_mine_nm'
WHERE Column_Old='msha_Mine_curr_mine_nm';

UPDATE Column_Rename
SET Column_New='c_m_ind'
WHERE Column_Old='msha_Mine_c_m_ind';

UPDATE Column_Rename
SET Column_New='mine_type_cd'
WHERE Column_Old='msha_Mine_mine_type_cd';

UPDATE Column_Rename
SET Column_New='curr_stat_cd'
WHERE Column_Old='msha_Mine_curr_stat_cd';

UPDATE Column_Rename
SET Column_New='curr_stat_dt'
WHERE Column_Old='msha_Mine_curr_stat_dt';

UPDATE Column_Rename
SET Column_New='controller_id'
WHERE Column_Old='msha_Mine_controller_id';

UPDATE Column_Rename
SET Column_New='controller_nm'
WHERE Column_Old='msha_Mine_controller_nm';

UPDATE Column_Rename
SET Column_New='oper_id'
WHERE Column_Old='msha_Mine_oper_id';

UPDATE Column_Rename
SET Column_New='oper_nm'
WHERE Column_Old='msha_Mine_oper_nm';

UPDATE Column_Rename
SET Column_New='state_abbr'
WHERE Column_Old='msha_Mine_state_abbr';

UPDATE Column_Rename
SET Column_New='fips_cnty_nm'
WHERE Column_Old='msha_Mine_fips_cnty_nm';

UPDATE Column_Rename
SET Column_New='curr_ownr_beg_dt'
WHERE Column_Old='msha_Mine_curr_ownr_beg_dt';

UPDATE Column_Rename
SET Column_New='full_sic_cd'
WHERE Column_Old='msha_Mine_full_sic_cd';

UPDATE Column_Rename
SET Column_New='sic_desc'
WHERE Column_Old='msha_Mine_sic_desc';

UPDATE Column_Rename
SET Column_New='bom_state_cd'
WHERE Column_Old='msha_Mine_bom_state_cd';


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'fips_cnty_cd'
WHERE COLUMN_OLD = 'msha_Mine_fips_cnty_cd'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'cong_dist_cd'
WHERE COLUMN_OLD = 'msha_Mine_cong_dist_cd'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'company_type'
WHERE COLUMN_OLD = 'msha_Mine_company_type'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'district'
WHERE COLUMN_OLD = 'msha_Mine_district'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'office_cd'
WHERE COLUMN_OLD = 'msha_Mine_office_cd'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'office_name'
WHERE COLUMN_OLD = 'msha_Mine_office_name'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'assess_ctrl_no'
WHERE COLUMN_OLD = 'msha_Mine_assess_ctrl_no'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'primary_sic_cd_grp'
WHERE COLUMN_OLD = 'msha_Mine_primary_sic_cd_grp'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'primary_sic_cd_sfx'
WHERE COLUMN_OLD = 'msha_Mine_primary_sic_cd_sfx'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'secondary_sic_cd'
WHERE COLUMN_OLD = 'msha_Mine_secondary_sic_cd'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'secondary_sic_desc'
WHERE COLUMN_OLD = 'msha_Mine_secondary_sic_desc'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'secondary_sic_cd_sfx'
WHERE COLUMN_OLD = 'msha_Mine_secondary_sic_cd_sfx'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'secondary_sic_cd_grp'
WHERE COLUMN_OLD = 'msha_Mine_secondary_sic_cd_grp'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'primary_canvass_cd'
WHERE COLUMN_OLD = 'msha_Mine_primary_canvass_cd'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'primary_canvass_desc'
WHERE COLUMN_OLD = 'msha_Mine_primary_canvass_desc'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'secondary_canvass_cd'
WHERE COLUMN_OLD = 'msha_Mine_secondary_canvass_cd'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'secondary_canvass_desc'
WHERE COLUMN_OLD = 'msha_Mine_secondary_canvass_desc'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'mine_103i_desc'
WHERE COLUMN_OLD = 'msha_Mine_mine_103i_desc'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'curr_103i_cd'
WHERE COLUMN_OLD = 'msha_Mine_curr_103i_cd'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'curr_103i_dt'
WHERE COLUMN_OLD = 'msha_Mine_curr_103i_dt'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'port_oprn_ind'
WHERE COLUMN_OLD = 'msha_Mine_port_oprn_ind'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'port_fips_state_cd'
WHERE COLUMN_OLD = 'msha_Mine_port_fips_state_cd'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'hrs_per_shift'
WHERE COLUMN_OLD = 'msha_Mine_hrs_per_shift'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'prod_shifts_per_day'
WHERE COLUMN_OLD = 'msha_Mine_prod_shifts_per_day'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'employee_cnt'
WHERE COLUMN_OLD = 'msha_Mine_employee_cnt'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'employee_cnt'
WHERE COLUMN_OLD = 'msha_Mine_employee_cnt'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'exempt_ind'
WHERE COLUMN_OLD = 'msha_Mine_exempt_ind'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'longitude'
WHERE COLUMN_OLD = 'msha_Mine_longitude'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'latitude'
WHERE COLUMN_OLD = 'msha_Mine_latitude'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'avg_mine_height'
WHERE COLUMN_OLD = 'msha_Mine_avg_mine_height'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'mine_gas_category_cd'
WHERE COLUMN_OLD = 'msha_Mine_mine_gas_category_cd'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'methn_librtn'
WHERE COLUMN_OLD = 'msha_Mine_methn_librtn'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'prod_pits_cnt'
WHERE COLUMN_OLD = 'msha_Mine_prod_pits_cnt'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'non_prod_pits_cnt'
WHERE COLUMN_OLD = 'msha_Mine_non_prod_pits_cnt'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'tail_pond_cnt'
WHERE COLUMN_OLD = 'msha_Mine_tail_pond_cnt'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'pillar_rcvry_ind'
WHERE COLUMN_OLD = 'msha_Mine_pillar_rcvry_ind'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'highwall_mnr_ind'
WHERE COLUMN_OLD = 'msha_Mine_highwall_mnr_ind'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'multiple_pits_ind'
WHERE COLUMN_OLD = 'msha_Mine_multiple_pits_ind'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'miners_rep_ind'
WHERE COLUMN_OLD = 'msha_Mine_miners_rep_ind'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'safety_committee_ind'
WHERE COLUMN_OLD = 'msha_Mine_safety_committee_ind'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'mine_miles_ofc'
WHERE COLUMN_OLD = 'msha_Mine_mine_miles_ofc'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'directions_to_mine'
WHERE COLUMN_OLD = 'msha_Mine_directions_to_mine'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'nearest_town'
WHERE COLUMN_OLD = 'msha_Mine_nearest_town'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'sic_code_4_digit'
WHERE COLUMN_OLD = 'msha_Mine_sic_code_4_digit'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'contractor_mine_id'
WHERE COLUMN_OLD = 'msha_mine_contractor_mine_id'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'contractor_cntctr_id'
WHERE COLUMN_OLD = 'msha_mine_contractor_cntctr_id'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'contractor_cntctr_nm'
WHERE COLUMN_OLD = 'msha_mine_contractor_cntctr_nm'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'contractor_cntctr_start_dt'
WHERE COLUMN_OLD = 'msha_mine_contractor_cntctr_start_dt'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'contractor_cntctr_end_dt'
WHERE COLUMN_OLD = 'msha_mine_contractor_cntctr_end_dt'

select * from Column_Rename