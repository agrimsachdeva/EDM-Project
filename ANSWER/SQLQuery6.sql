IF OBJECT_ID (N'dbo.Contractor', N'U') IS NOT NULL
DROP TABLE dbo.Contractor;
GO
CREATE TABLE [dbo].[Contractor](
	[cntctr_id] [varchar](500) NOT NULL primary key,
	[cntctr_nm] [varchar](50) NULL,
	[indstry_dim_id] [integer] NOT NULL,
	[zip_dim_id] [integer] NULL,
)  ON [PRIMARY]

IF OBJECT_ID (N'dbo.[mhsa_commodity_lookup]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_commodity_lookup];
GO
CREATE TABLE [dbo].[mhsa_commodity_lookup](
	[actv_dt] [Date] NULL,
	[actv_ind] [char](1) NULL,
	[cmmdty_cd] [varchar](8) NOT NULL Primary key,
	[cmmdty_desc] [varchar](450) NULL,
	[inactv_dt] [Date] NULL,
	[naics_cd] [varchar](8) NULL,
	[old_sic_cd] [varchar](5) NULL,
	[sffx_cd] [varchar](4) NULL,
	[sic_cd] [varchar](8) NULL,
)  ON [PRIMARY]


IF OBJECT_ID (N'dbo.[mhsa_controller_history]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_controller_history];
GO
CREATE TABLE [dbo].[mhsa_controller_history](
	[ctrlr_end_dt] [Date] NULL,
	[ctrlr_id] [varchar](500) NOT NULL Primary key,
	[ctrlr_nm] [varchar](7) NOT NULL ,
	[ctrlr_start_dt] [Date] NULL,
	[indstry_dim_id] [Integer] NULL,
	[load_dt] [Date] NULL,
	[oper_id] [varchar](7) NULL,
	[oper_nm] [varchar](60) NULL,
	[state_dim_id] [Integer] NULL,
)  ON [PRIMARY]


IF OBJECT_ID (N'dbo.mhsa_mine', N'U') IS NOT NULL
DROP TABLE dbo.mhsa_mine;
GO
CREATE TABLE [dbo].[mhsa_mine](
	[assess_ctrl_no] [varchar](500) NULL,
	[avg_mine_height] [varchar](500) NULL,
	[avg_annual_empl] [varchar](500) NULL,
	[bom_state_cd] [varchar](500) NULL,
	[c_m_ind] [varchar](500) NULL,
	[contractor_mine_id] [varchar](500) NULL,
	[cntrctr_id] [varchar](500) NULL,
	[contractor_cntrctr_nm] [varchar](500) NULL,
	[contractor_start_dt] [varchar](500) NULL,
	[contractor_end_dt] [varchar](500) NULL,
	[company_type] [varchar](500) NULL,
	[cong_dist_cd] [varchar](500) NULL,
	[controller_id] [varchar](500) NULL,
	[controller_nm] [varchar](500) NULL,
	[curr_103i_cd] [varchar](500) NULL,
	[curr_mine_nm] [varchar](500) NULL,
	[curr_ownr_beg_dt] [varchar](500) NULL,
	[curr_stat_cd] [varchar](500) NULL,
	[curr_stat_dt] [varchar](500) NULL,
	[current_103i_dt] [varchar](500) NULL,
	[days_per_week] [varchar](500) NULL,
 	[directions_to_mine] [varchar](500) NULL,
	[district] [varchar](500) NULL,
	[employee_cnt] [varchar](500) NULL,
	[exempt_ind] [varchar](500) NULL,
	[fips_cnty_cd] [varchar](500) NULL,
	[full_sic_cd] [varchar](500) NULL,
	[fips_cnty_nm] [varchar](500) NULL,
	[sic_code_4_digit] [varchar](500) NULL,
 	[highwall_mnr_ind] [varchar](500) NULL,
	[hrs_per_shift] [varchar](500) NULL,
	[latitude] [varchar](500) NULL,
	[longitude] [varchar](500) NULL,
	[maint_shifts_per_day] [varchar](500) NULL,
	[methn_librtn] [varchar](500) NULL,
	[mine_103i_desc] [varchar](500) NULL,
	[mine_gas_category_cd] [varchar](500) NULL,
	[mine_id] [varchar](500) NOT NULL Primary key,
 	[mine_miles_ofc] [varchar](500) NULL,
	[mine_type_cd] [varchar](500) NULL,
 	[miners_rep_ind] [varchar](500) NULL,
 	[multiple_pits_ind] [varchar](500) NULL,
 	[nearest_town] [varchar](500) NULL,
	[non_prod_pits_cnt] [varchar](500) NULL,
	[office_cd] [varchar](500) NULL,
	[office_name] [varchar](500) NULL,
	[oper_id] [varchar](500) NULL,
	[oper_nm] [varchar](500) NULL,
	[pillar_rcvry_ind] [varchar](500) NULL,
	[port_oprn_ind] [varchar](500) NULL,
	[port_fips_state_cd] [varchar](500) NULL,
	[primary_canvass_cd] [varchar](500) NULL,
	[primary_canvass_desc] [varchar](500) NULL,
	[primary_sic_cd_grp] [varchar](500) NULL,
	[primary_sic_cd_sfx] [varchar](500) NULL,
	[prod_pits_cnt] [varchar](500) NULL,
	[prod_shifts_per_day] [varchar](500) NULL,
 	[safety_committee_ind] [varchar](500) NULL,
	[secondary_canvass_cd] [varchar](500) NULL,
	[secondary_canvass_desc] [varchar](500) NULL,
	[secondary_sic_cd] [varchar](500) NULL,
	[secondary_sic_cd_grp] [varchar](500) NULL,
	[secondary_sic_cd_sfx] [varchar](500) NULL,
	[secondary_sic_desc] [varchar](500) NULL,
	[sic_desc] [varchar](500) NULL,
	[state_abbr] [varchar](500) NULL,
	[tail_pond_cnt] [varchar](500) NULL,
	FOREIGN KEY (cntrctr_id) REFERENCES Contractor(cntctr_id),
	FOREIGN KEY (controller_id) REFERENCES mhsa_controller_history(ctrlr_id)

)  


IF OBJECT_ID (N'dbo.[mhsa_inspection]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_inspection];
GO
CREATE TABLE [dbo].[mhsa_inspection](
	[active_sections] [varchar](500)  NULL,
	[acty_cd] [varchar](500)  NULL,
	[acty_desc] [varchar](500)  NULL,
	[beg_dt] [varchar](500) NULL,
	[bldg_constr_sites][varchar](500) NULL,
	[cal_qtr] [varchar](500)  NULL,
	[cal_yr] [varchar](500) NULL,
	[co_records] [varchar](500) NULL,
	[coal_metal_ind] [varchar](500) NULL,
	[controller_id][varchar](500)  NULL,
	[controller_name] [varchar](500)  NULL,
	[draglines] [varchar](500) NULL,
	[end_dt] [varchar](500) NULL,
	[event_no] [varchar](500) NOT NULL Primary Key,
	[explosive_storage] [varchar](500) NULL,
	[fiscal_qtr] [varchar](500)  NULL,
	[fiscal_yr] [varchar](500)  NULL,
	[idle_sections] [varchar](500) NULL,
	[impound_constr] [varchar](500) NULL,
	[impoundments] [varchar](500) NULL,
	[inspect_office_cd] [varchar](500) NULL,
	[major_constr] [varchar](500) NULL,
	[mine_id] [varchar](500) NULL,
	[misc_area] [varchar](500) NULL,
	[nbr_inspectors] [varchar](500) NULL,
	[operator_id] [varchar](500)  NULL,
	[operator_name] [varchar](500)  NULL,
	[outby_areas] [varchar](500) NULL,
	[program_area] [varchar](500) NULL,
	[refuse_piles] [varchar](500) NULL,
	[sample_cnt_air] [varchar](500) NULL,
	[sample_cnt_dustspot] [varchar](500) NULL,
	[sample_cnt_dustsurvey] [varchar](500) NULL,
	[sample_cnt_noise] [varchar](500) NULL,
	[sample_cnt_respdust] [varchar](500) NULL,
	[shaft_slope_sink] [varchar](500) NULL,
	[shafts_slopes] [varchar](500) NULL,
	[facility_mine] [varchar](500) NULL,
	[surf_ug_mine] [varchar](500) NULL,
	[total_insp_hours] [varchar](500) NULL,
	[total_on_site_hours] [varchar](500) NULL,
	[unclassified_constr] [varchar](500) NULL,
	[inspection_begin_year] [varchar](500) NULL,
	[inspection_end_year] [varchar](500) NULL,
	[state_abbr] [varchar](500) NULL,
	[sic_code_4_digit] [varchar](500) NULL,
	[mine_type_cd] [varchar](500) NULL,
	[curr_mine_nm] [varchar](500) NULL,
	[curr_stat_cd] [varchar](500) NULL,
	[curr_stat_dt] [varchar](500) NULL,
	[sig_sub_y] [varchar](500) NULL,
	[sig_sub_n] [varchar](500) NULL,
    FOREIGN KEY (controller_id) REFERENCES mhsa_controller_history(ctrlr_id),
	FOREIGN KEY (mine_id) REFERENCES MHSA_Mine(mine_id)
)   ON [PRIMARY]
