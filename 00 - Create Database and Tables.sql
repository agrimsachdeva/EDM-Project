USE [master]
GO
/****** Object:  Database [MSHA]    Script Date: 3/2/2016 4:40:22 PM ******/

IF EXISTS(select * from sys.databases where name='MSHA')
DROP DATABASE MSHA;
go



CREATE DATABASE MSHA
 GO
ALTER DATABASE MSHA SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MSHA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MSHA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MSHA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MSHA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MSHA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MSHA] SET ARITHABORT OFF 
GO
ALTER DATABASE [MSHA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MSHA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MSHA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MSHA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MSHA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MSHA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MSHA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MSHA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MSHA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MSHA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MSHA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MSHA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MSHA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MSHA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MSHA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MSHA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MSHA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MSHA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MSHA] SET RECOVERY FULL 
GO
ALTER DATABASE [MSHA] SET  MULTI_USER 
GO
ALTER DATABASE [MSHA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MSHA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MSHA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MSHA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MSHA]
GO
/****** Object:  Table [dbo].[AllstarFull]    Script Date: 3/2/2016 4:40:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.Contractor', N'U') IS NOT NULL
DROP TABLE dbo.Contractor;
GO
CREATE TABLE [dbo].[Contractor](
	[cntctr_id] [varchar](10) NOT NULL primary key,
	[cntctr_nm] [varchar](50) NULL,
	[indstry_dim_id] [integer] NOT NULL,
	[zip_dim_id] [integer] NULL,
)  ON [PRIMARY]

/* Create table mhsa_mine_contractor*/
IF OBJECT_ID (N'dbo.mhsa_mine_contractor', N'U') IS NOT NULL
DROP TABLE dbo.mhsa_mine_contractor;
GO
CREATE TABLE [dbo].[mhsa_mine_contractor](
	[cntctr_end_dt] [Date]  NULL,
	[cntctr_id] [varchar](10) NOT NULL,
	[cntctr_nm] [varchar](5) NULL,
	[cntctr_start_dt] [DATE] NULL,
	[indstry_dim_id] [integer] NOT NULL,
	[load_dt] [Date] NULL,
	[mine_id] [varchar](7) NOT NULL primary key,
	[zip_dim_id] [integer] NULL,
	FOREIGN KEY (cntctr_id) REFERENCES Contractor(cntctr_id),
	FOREIGN KEY (indstry_dim_id) REFERENCES Contractor(indstry_dim_id)
)  ON [PRIMARY]

/* Create table mhsa_cy_cntctr_emplymnt*/
IF OBJECT_ID (N'dbo.mhsa_cy_cntctr_emplymnt', N'U') IS NOT NULL
DROP TABLE dbo.mhsa_cy_cntctr_emplymnt;
GO
CREATE TABLE [dbo].[mhsa_cy_cntctr_emplymnt](
	[annual_coal_prod] [Integer]  NULL,
	[annual_hrs] [Integer] NULL,
	[avg_annual_empl] [Integer] NULL,
	[calendar_yr] [Integer] NULL,
	[cmdty_type] [Char](1) NULL,
	[cntctr_id] [varchar](10) NOT NULL,
	[indstry_dim_id] [Integer] NOT NULL primary key,
	[load_dt] [Date] NULL,
	[subunit_cd] [varchar](25) NULL,
	[zip_dim_id] [Integer] NULL,
	FOREIGN KEY (cntctr_id) REFERENCES Contractor(cntctr_id)
)  ON [PRIMARY]

use MSHA;
IF OBJECT_ID (N'dbo.mine_accident', N'U') IS NOT NULL
DROP TABLE dbo.mine_accident;
GO
CREATE TABLE [dbo].[mine_accident](
	[accident_time] [Integer]  NULL,
	[accident_type] [varchar](30) NULL,
	[accident_type_cd] [varchar](2) NULL,
	[activity_cd] [varchar](3) NULL,
	[ai_acty_desc] [varchar](33) NULL,
	[ai_class_desc] [varchar](37) NULL,
	[ai_dt] [Date] NULL,
	[ai_narr] [varchar](384) NULL,
	[ai_occ_desc] [varchar](40) NULL,
	[cal_qtr] [Integer] NULL,
	[cal_yr] [Integer] NULL,
	[classification_cd] [varchar](2) NOT NULL Primary Key,
	[closed_doc_no] [varchar](12) NULL,
	[cntctr_id] [varchar](10) NULL,
	[coal_metal_ind] [varchar](1) NULL,
	[controller_id] [varchar](7) NULL,
	[controller_name] [varchar](60) NULL,
	[days_lost] [Integer] NULL,
	[days_restrict] [Integer] NULL,
	[dergree_injury_cd] [Integer] NULL,
	[document_no] [Integer] NULL,
	[equip_mfr_cd] [Integer] NULL,
	[equip_mfr_name] [varchar](2) NULL,
	[equip_model_no] [varchar](12) NULL,
	[exper_job_calc] [varchar](4) NULL,
	[exper_mine_calc] [varchar](50) NULL,
	[exper_tot_calc] [Integer] NULL,
	[fips_state_cd] [Integer] NULL,
	[fiscal_qtr] [Integer] NULL,
	[fiscal_yr] [Integer] NULL,
	[immed_notify] [varchar](20)NULL,
	[inj_body_part] [varchar](2) NULL,
	[inj_body_part_cd] [varchar](39) NULL,
	[inj_degr_desc] [varchar](30) NULL,
	[injury_source] [varchar](25) NULL,
	[injury_source_cd] [varchar](3) NULL,
    [invest_begin_dt] [Date] NULL,
	[mine_id] [varchar](7) NOT NULL,
	[mining_equip] [varchar](56) NULL,
	[mining_equip_cd] [varchar](6) NULL,
	[nature_injury] [varchar](25) NULL,
	[nature_injury_cd] [varchar](3) NULL,
	[no_injuries] [Integer] NULL,
	[occupation_cd] [varchar](3) NULL,
	[operator_id] [varchar](7) NULL,
	[operator_name] [varchar](60) NULL,
	[return_to_work_dt] [Date] NULL,
	[schedule_charge] [Integer] NULL,
	[shift_begin_time] [varchar](4) NULL,
	[subunit_cd] [varchar](2) NULL,
	[subunit_desc] [varchar](32) NULL,
	[trans_term] [varchar](1) NULL,
	[ug_location] [varchar](28) NULL,
    [ug_location_cd] [varchar](2) NULL,
	[ug_mining_method] [varchar](20) NULL,
	[ug_mining_method_cd] [varchar](2) NULL,
	FOREIGN KEY (cntctr_id) REFERENCES Contractor(cntctr_id)
)  ON [PRIMARY]


/* Create table mhsa_address_of_record]*/
IF OBJECT_ID (N'dbo.[mhsa_address_of_record]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_address_of_record];
GO
CREATE TABLE [dbo].[mhsa_address_of_record](
	[mine_id] [varchar](7)  NOT NULL,
	[mine_name] [varchar](50) NOT NULL,
	[contact_title] [varchar](30) NULL,
	[nearest_town] [varchar](30) NULL,
	[business_name] [varchar](50) NOT NULL,
	[street] [varchar](80) NULL,
	[city] [varchar](30) NOT NULL,
	[state_abbr] [varchar](2) NULL,
	[fips_state_cd] [varchar](2) NULL,
	[state][varchar](40) NULL,
	[zip_cd] [varchar](9) NULL,
	[country] [varchar](30) NULL,
	[province] [varchar](20) NULL,
	[postal_cd] [varchar](20) NULL,
	[mine_type_cd] [varchar](20) NULL,
	[mine_states] [varchar](50) NOT NULL,
	[mine_status_dt] [Date] NOT NULL,
	[primary_sic_cd] [varchar](80) NOT NULL,
	[coal_metal_ind] [varchar](1) NOT NULL,
	[po_box] [varchar](30) NULL,
	/*FOREIGN KEY (mine_id) REFERENCES Contractor(cntctr_id)*/
)  ON [PRIMARY]

IF OBJECT_ID (N'dbo.[mhsa_address_of_record]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_address_of_record];
GO
CREATE TABLE [dbo].[mhsa_address_of_record](
	[mine_id] [varchar](7)  NOT NULL,
	[mine_name] [varchar](50) NOT NULL,
	[contact_title] [varchar](30) NULL,
	[nearest_town] [varchar](30) NULL,
	[business_name] [varchar](50) NOT NULL,
	[street] [varchar](80) NULL,
	[city] [varchar](30) NOT NULL,
	[state_abbr] [varchar](2) NULL,
	[fips_state_cd] [varchar](2) NULL,
	[state][varchar](40) NULL,
	[zip_cd] [varchar](9) NULL,
	[country] [varchar](30) NULL,
	[province] [varchar](20) NULL,
	[postal_cd] [varchar](20) NULL,
	[mine_type_cd] [varchar](20) NULL,
	[mine_states] [varchar](50) NOT NULL,
	[mine_status_dt] [Date] NOT NULL,
	[primary_sic_cd] [varchar](80) NOT NULL,
	[coal_metal_ind] [varchar](1) NOT NULL,
	/*FOREIGN KEY (mine_id) REFERENCES Contractor(cntctr_id)*/
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
	[ctrlr_id] [varchar](7) NOT NULL Primary key,
	[ctrlr_nm] [varchar](7) NOT NULL ,
	[ctrlr_start_dt] [Date] NULL,
	[indstry_dim_id] [Integer] NULL,
	[load_dt] [Date] NULL,
	[oper_id] [varchar](7) NULL,
	[oper_nm] [varchar](60) NULL,
	[state_dim_id] [Integer] NULL,
)  ON [PRIMARY]

IF OBJECT_ID (N'dbo.[mhsa_cy_cntctr_emplymnt]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_cy_cntctr_emplymnt];
GO
CREATE TABLE [dbo].[mhsa_cy_cntctr_emplymnt](
	[annual_coal_prod] [Integer] NULL,
	[annual_hrs] [Integer] NULL,
	[avg_annual_empl] [Integer] NULL,
	[calendar_yr] [Integer] NULL,
	[cmdty_type] [Char](1) NULL,
	[cntctr_id] [varchar](10) NOT NULL,
	[indstry_dim_id] [Integer] NULL,
	[load_dt] [Date] NULL,
	[subunit_cd] [varchar](25) NULL,
	[zip_dim_id] [Integer] NULL,
	FOREIGN KEY (cntctr_id) REFERENCES dbo.Contractor(cntctr_id)
)  ON [PRIMARY]

IF OBJECT_ID (N'dbo.[mhsa_cy_oprtr_emplymnt]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_cy_oprtr_emplymnt];
GO
CREATE TABLE [dbo].[mhsa_cy_oprtr_emplymnt](
	[annual_coal_prod] [Integer] NULL,
	[annual_hrs] [Integer] NULL,
	[avg_annual_empl] [Integer] NULL,
	[calendar_yr] [Integer] NULL,
	[cntctr_id] [varchar](10) NOT NULL,
	[indstry_dim_id] [Integer] NULL,
	[load_dt] [Date] NULL,
	[mine_id] [varchar](25) NULL,
	[subunit_cd] [char](2),
	[zip_dim_id] [Integer] NULL,
	FOREIGN KEY (cntctr_id) REFERENCES dbo.Contractor(cntctr_id)
)  ON [PRIMARY]

IF OBJECT_ID (N'dbo.[mhsa_operator_history]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_operator_history];
GO
CREATE TABLE [dbo].[mhsa_operator_history](
	[indstry_dim_id] [Integer] NOT NULL,
	[load_dt] [Date] NULL,
	[mine_id] [varchar](7) NULL,
	[mine_nm] [varchar](50) NULL,
	[oper_end_dt] [Date] NULL,
	[oper_id] [varchar](7) NOT NULL primary key,
	[oper_nm] [varchar](60) NULL,
	[oper_start_dt] [Date] NULL,
	[state_dim_dt] [Integer],
	FOREIGN KEY (indstry_dim_id) REFERENCES dbo.mhsa_cy_cntctr_emplymnt(indstry_dim_id)
)  ON [PRIMARY]

use MSHA;
IF OBJECT_ID (N'dbo.[mhsa_qtrly_cntrctr_emplymnt]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_qtrly_cntrctr_emplymnt];
GO
CREATE TABLE [dbo].[mhsa_qtrly_cntrctr_emplymnt](
	[avg_empl_cnt] [Integer] NULL,
	[cmdty_type] [char](1) NULL,
	[cntctr_id] [varchar](10) NOT NULL Primary Key,
	[coal_prod] [Integer] NULL,
	[empl_hrs] [Integer] NULL,
	[empl_prod_qtr] [char](1) NOT NULL,
	[empl_prod_yr] [Integer] NULL,
	FOREIGN KEY (cntctr_id) REFERENCES dbo.contractor(cntctr_id)
)  ON [PRIMARY]

use MSHA;
IF OBJECT_ID (N'dbo.[mhsa_assssd_violation]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_assssd_violation];
GO
CREATE TABLE [dbo].[mhsa_assssd_violation](
	[citation_nbr] [varchar](7) NOT NULL Primary Key,
	[violator_id] [varchar](9) NULL,
	[violator_name] [varchar](50) NULL,
	[proposed_penalty_amt] [Integer] NULL,
	[current_assessment_amt] [Integer] NULL,
	[paid_proposed_penalty_amt] [Integer] NULL,
	[last_action_code] [varchar](30) NULL,
	[final_order_date] [Date] NULL,
	[bill_print_date] [Date] NULL,
	[last_action_code_1] [varchar](10) NULL,
	[last_action_date] [Date] NULL,
	/*FOREIGN KEY (violator_id) REFERENCES dbo.contractor(cntctr_id)*/
)  ON [PRIMARY]

use MSHA;
IF OBJECT_ID (N'dbo.[mhsa_inspection]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_inspection];
GO
CREATE TABLE [dbo].[mhsa_inspection](
	[active_sections] [Integer] NULL,
	[acty_cd] [varchar](55) NULL,
	[acty_desc] [varchar](20) NULL,
	[beg_dt] [Date]NULL,
	[bldg_constr_sites][Integer] NULL,
	[cal_qtr] [Integer] NULL,
	[cal_year] [Integer] NULL,
	[co_records] [varchar](1) NULL,
	[coal_metal_ind] [varchar](1) NULL,
	[controller_id] [varchar](7) NOT NULL,
	[controller_name] [varchar](7) NULL,
	[draglines] [Integer] NULL,
	[end_dt] [Date] NULL,
	[event_no] [varchar](7) NOT NULL Primary Key,
	[explosive_storage] [varchar](1) NULL,
	[fiscal_qtr] [Integer] NULL,
	[fiscal_yr] [Integer] NULL,
	[idle_sections] [Integer] NULL,
	[impound_constr] [Integer] NULL,
	[impoundments] [varchar](1) NULL,
	[inspect_office_cd] [varchar](5) NULL,
	[major_const] [varchar](1) NULL,
	[mine_id] [varchar](7) NOT NULL,
	[misc_area] [varchar](1) NULL,
	[nbr_inspectors] [Integer] NULL,
	[operator_id] [varchar](7) NOT NULL,
	[operator_name] [varchar](60) NULL,
	[outby_areas] [varchar](1) NULL,
	[program_areas] [varchar](60) NULL,
	[refuse_piles] [varchar](1) NULL,
	[sample_cnt_air] [Integer] NULL,
	[sample_cnt_dustspot] [Integer] NULL,
	[sample_cnt_dustsurvey] [Integer] NULL,
	[sample_cnt_noise] [Integer] NULL,
	[sample_cnt_respdust] [Integer] NULL,
	[shaft_slope_sink] [Integer] NULL,
	[shafts_slopes] [Integer] NULL,
	[surf_facilty_mine] [varchar](1) NULL,
	[surf_ug_mine] [varchar](1) NULL,
	[total_insp_hours] [Integer] NULL,
	[total_on_site_hours] [Integer] NULL,
	[unclassified_constr] [Integer] NULL,
    /*FOREIGN KEY (violator_id) REFERENCES dbo.contractor(cntctr_id)*/
)  ON [PRIMARY]

use MSHA;
IF OBJECT_ID (N'dbo.[mhsa_violation]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_violation];
GO
CREATE TABLE [dbo].[mhsa_violation](
	[asmt_generated_ind] [varchar](1) NULL,
	[bill_print_dt] [Date] NULL,
	[cal_qtr] [Integer] NULL,
	[coal_metal_ind] [varchar](1) NULL,
	[contested_dt] [Date] NULL,
	[contested_ind] [varchar](4) NULL,
	[cntctr_id] [varchar](10) NULL,
	[controller_id] [varchar](7) NULL,
	[controller_name] [varchar](72) NULL,
	[docket_no] [varchar](4) NULL,
	[docket_status_cd] [varchar](4) NULL,
	[enforcement_area] [varchar](20) NULL,
	[event_no] [varchar](7) NOT NULL,
	[fiscal_qtr] [Integer] NULL,
	[fiscal_yr] [Integer] NULL,
	[initial_viol_no] [varchar](30) NULL,
	[inj_illness] [varchar](20) NULL,
	[inspection_begin_dt] [Date] NULL,
	[imspection_end_dt] [Date] NULL,
	[iss_dt] [Date] NULL,
	[last_action_cd] [varchar](4) NULL,
	[last_action_dt] [Date] NULL,
	[lastest_term_due_dt] [Date] NULL,
	[lastest_term_due_time] [varchar](4) NULL,
	[likelihood] [varchar](20) NULL,
	[mine_id] [varchar](7) NOT NULL,
	[mine_name_char] [varchar](50) NULL,
	[mine_type] [varchar](20) NULL,
	[negligence] [varchar](20) NULL,
	[no_affected] [Integer] NULL,
	[orig_term_due_dt] [Date] NULL,
	[orig_term_due_time] [Date] NULL,
	[part_section] [varchar](20) NULL,
	[primary_or_mill] [varchar](30) NULL,
	[replaced_by_order_no] [varchar](30) NULL,
	[right_to_conf_dt] [varchar](20) NULL,
	[section_of_act] [varchar](20) NULL,
	[section_of_act_2] [varchar](20) NULL,
	[sig_sub] [varchar](1) NULL,
	[special_assess] [varchar](1) NULL,
	[term_dt] [Date] NULL,
	[termination_type] [varchar](20) NULL,
	[type_of_actn_1] [varchar](20) NULL,
	[violation_issue_dt] [Date] NULL,
	[violation_issue_time] [Integer] NULL,
	[violation_occur_dt] [Date] NULL,
	[viol_no] [varchar](30) NOT NULL Primary Key,
	[violator_id] [varchar](7) NULL,
	[violator_name] [varchar](60) NULL,
	[violator_type_cd] [varchar](20) NULL,
	[written_notice] [varchar](1) NULL,
	/*FOREIGN KEY (mine_id) REFERENCES dbo.contractor(mine_id)*/
)  ON [PRIMARY]

use MSHA;
IF OBJECT_ID (N'dbo.[mhsa_commodity_lookup]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_commodity_lookup];
GO
CREATE TABLE [dbo].[mhsa_commodity_lookup](
	[actv_dt] [Date] NULL ,
	[actv_ind] [char](1) NULL,
	[cmmdty_cd] [varchar](8) NOT NULL Primary Key,
	[cmmdty_desc] [Integer] NULL,
	[inactv_dt] [Date] NULL,
	[naics_cd] [varchar](8) NULL,
	[old_sic_cd] [varchar](5) NULL,
	[sffx_cd] [varchar](4) NULL,
	[sic_cd] [varchar](8) NULL,
	/*FOREIGN KEY (violator_id) REFERENCES dbo.contractor(cntctr_id)*/
)  ON [PRIMARY]

use MSHA;
IF OBJECT_ID (N'dbo.[msha_controller_history]', N'U') IS NOT NULL
DROP TABLE dbo.[msha_controller_history];
GO
CREATE TABLE [dbo].[msha_controller_history](
	[ctrlr_end_dt] [Date] NULL ,
	[ctrlr_id] [varchar](7) NOT NULL Primary Key,
	[ctrlr_nm] [varchar](72) NOT NULL ,
	[ctrlr_state_dt] [Date] NULL,
	[indstry_dim_id] [Integer] NULL,
	[load_dt] [Date] NULL,
	[oper_id] [varchar](7) NULL,
	[oper_nm] [varchar](60) NULL,
	[state_dim_id] [Integer] NULL,
	/*FOREIGN KEY (violator_id) REFERENCES dbo.contractor(cntctr_id)*/
)  ON [PRIMARY]


use MSHA;
IF OBJECT_ID (N'dbo.[msha_mine_contractor]', N'U') IS NOT NULL
DROP TABLE dbo.[msha_mine_contractor];
GO
CREATE TABLE [dbo].[msha_mine_contractor](
	[cntctr_end_dt] [Date] NULL ,
	[cntctr_id] [varchar](10) NOT NULL Primary Key,
	[cntctr_nm] [varchar](50) NOT NULL ,
	[cntctr_start_dt] [Date] NULL,
	[indstry_dim_id] [Integer] NULL,
	[load_dt] [Date] NULL,
	[mine_id] [varchar](7) NULL,
	[zip_dim_id] [Integer] NULL,
	/*FOREIGN KEY (violator_id) REFERENCES dbo.contractor(cntctr_id)*/
)  ON [PRIMARY]


use MSHA;
IF OBJECT_ID (N'dbo.[msha_qtrly_oprtr_emplymnt]', N'U') IS NOT NULL
DROP TABLE dbo.[msha_qtrly_oprtr_emplymnt];
GO
CREATE TABLE [dbo].[msha_qtrly_oprtr_emplymnt](
	[coal_prod] [Integer] NULL ,
	[empl_hrs] [Integer] NULL ,
	[empl_prod_qtr] [char](1) NULL ,
	[empl_prod_yr] [Integer] NULL,
	[indstry_dim_id] [Integer] NULL,
	[fiscal_qtr] [char](1) NULL,
	[fiscal_yr] [Integer] NULL,
	[load_dt] [Date] NULL,
	[petreemine_id] [varchar](7) NOT NULL Primary Key,
	[state_dim_id] [Integer] NULL,
	[subunit_cd] [char](2) NULL,
	[subunit_desc] [varchar](32) NULL,
	/*FOREIGN KEY (indstry_dim_id) REFERENCES dbo.contractor(indstry_dim_id)*/
)  ON [PRIMARY]


use MSHA;
IF OBJECT_ID (N'dbo.[msha_assssd_violation]', N'U') IS NOT NULL
DROP TABLE dbo.[msha_assssd_violation];
GO
CREATE TABLE [dbo].[msha_assssd_violation](
	[citation_nbr] [varchar](7) NOT NULL ,
	[violation_id] [varchar](9) NOT NULL Primary key ,
	[violator_name] [varchar](50) NULL ,
	[proposed_penalty_amt] [Integer] NULL,
	[current_assessment_amt] [Integer] NULL,
	[paid_proposed_penalty_amt] [Integer] NULL,
	[last_action_code] [varchar](30) NULL,
	[final_order_date] [Date] NULL,
	[bill_print_date] [Date],
	[last_action_code_1] [varchar](10) NULL,
	[last_action_date] [Date] NULL
	/*FOREIGN KEY (violation_id) REFERENCES dbo.contractor(violation_id)*/
)  ON [PRIMARY]

/* Create table MSHA_MINE & MSHA_INSPECTION*/
IF OBJECT_ID (N'dbo.mhsa_mine', N'U') IS NOT NULL
DROP TABLE dbo.mhsa_mine;
GO
CREATE TABLE [dbo].[mhsa_mine](
	[assess_ctrl_no] [varchar](20) NULL,
	[avg_mine_height] [Integer](5) NULL,
	[avg_annual_empl] [Integer] NULL,
	[bom_state_cd] [varchar](2) NULL,
	[c_m_ind] [varchar](1) NULL,
	[company_type] [varchar](80) NOT NULL,
	[cong_dist_cd] [varchar](2) NOT NULL,
	[controller_id] [varchar](7) NULL,
	[controller_nm] [varchar](72) NULL,
	[curr_103i_cd] [varchar](2)  NULL,
	[curr_mine_nm] [varchar](50) NULL,
	[curr_ownr_beg_dt] [Date] NULL,
	[curr_stat_cd] [varchar](50) NULL,
	[curr_stat_dt] [Date] NULL,
	[current_103i_dt] [Date] NULL,
	[days_per_week] [Integer](2) NOT NULL,
	[directions_to_mine] [varchar](300) NOT NULL,
	[district] [varchar](3) NULL,
	[employee_cnt] [Integer](5) NULL,
	[exempt_ind] [varchar](1)  NULL,
	[fips_cnty_cd] [varchar](3) NULL,
	[fips_cnty_nm] [varchar](80) NULL,
	[full_sic_cd] [varchar](6) NULL,
	[highwall_mnr_ind] [varchar](1) NULL,
	[hours_per_shift] [Integer](2) NULL,
	[latitude] [varchar](9) NOT NULL,
	[longitude] [varchar](10) NOT NULL,
	[maint_shifts_per_day] [Integer](3) NULL,
	[methn_librtn] [Integer](9) NULL,
	[mine_103i_desc] [varchar](80)  NULL,
	[mine_gas_category_cd] [varchar](20) NULL,
	[mine_id] [varchar](7) NULL PRIMARY KEY,
	[mine_miles_ofc] [Integer](5) NULL,
	[mine_type_cd] [varchar](20) NULL,
	[miners_rep_ind] [varchar](1) NULL,
	[multiple_pits_ind] [varchar](1) NOT NULL,
	[nearest_town] [varchar](30) NOT NULL,
	[non_prod_pits_cnt] [Integer](5) NULL,
	[office_cd] [varchar](5)  NULL,
	[office_name] [varchar](80)  NULL,
	[oper_id] [varchar](7) NULL,
	[oper_nm] [varchar](60) NULL,
	[pillar_rcvry_ind] [varchar](1) NULL,
	[port_oprn_ind] [varchar](1) NULL,
	[portable_fips_st_cd] [varchar](2) NULL,
	[primary_canvass_cd] [varchar](20) NOT NULL,
	[primary_canvass_desc] [varchar](20) NOT NULL,
	[primary_sic_cd_grpt] [varchar](80) NULL,
	[primary_sic_cd_sfx] [varchar](2)  NULL,
	[prod_pits_cnt] [Integer](3)  NULL,
	[prod_shifts_per_day] [Integer](3) NULL,
	[oper_nm] [varchar](60) NULL,
	[safety_committee_ind] [varchar](1) NULL,
	[secondary_canvass_cd] [varchar](20) NULL,
	[secondary_canvass_desc] [varchar](20) NULL,
	[secondary_sic_cd] [varchar](6) NOT NULL,
	[secondary_sic_cd_grp] [varchar](4) NOT NULL,
	[secondary_sic_cd_sfx] [varchar](2) NULL,
	[secondary_sic_desc] [varchar](80)  NULL,
	[sic_desc] [varchar](80)  NULL,
	[state_abbr] [varchar] (80) NULL,
	[tail_pond_cnt] [Integer] (3) NULL,
	FOREIGN KEY (cntctr_id) REFERENCES Contractor(cntctr_id)
)  ON [PRIMARY]


