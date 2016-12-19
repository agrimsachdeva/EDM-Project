

--a. Use RANK to shown the ranking of states in the database according to the number of records for each state

 select state_abbr,  COUNT(state_abbr) as state_count, rank() over (order by count(state_abbr) desc)
  as Rank from mhsa_mine group by state_abbr

-- b.	Use NTILE to split the states into quartiles


select state_abbr, count(state_abbr) as state_count, ntile(4) over (order by count(state_abbr) desc) as Quartile from mhsa_mine
group by state_abbr 


--c.	Use percent_rank to show ranking of the states

 select state_abbr,  COUNT(state_abbr) as state_count, round(percent_rank() over (order by count(state_abbr) desc),3)
  as Percentage from mhsa_mine group by state_abbr

--d. let's write some simple queries - like sort date in descte


INSPECTION

AND BY CAL YR IN INSPECTION
AND BY INSPECTION HOURS IN INSPECTION


--select all the operators working in mine in year 1979 and 1981 with respect to their joining date of the work

select operator_name, cal_yr from mhsa_inspection where cal_yr in ('1979', '1980') order by beg_dt;

-- Display the count of employees working in particular Mine

select  curr_mine_nm, count(employee_cnt) as Employee_count from mhsa_mine group by curr_mine_nm ;

-- Display controller_nm, curr_mine_nm,   office_nm

select m.controller_nm, m.curr_mine_nm, o.office_nm from mhsa_controller_history m inner join on mhsa_mine where 
