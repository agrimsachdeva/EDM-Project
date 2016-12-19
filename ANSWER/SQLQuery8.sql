select distinct TF.[franchName], P.[Player Name], [Average Salary],round(CUME_DIST() over(order by [Average Salary]),3) as Cume_Dist, 
round(PERCENT_RANK() over(order by [Average Salary]),3) as Percent_Rank  from TeamsFranchises TF, Player_History P, Teams T 
where P.[ID of Last Team] = T.teamID
and T.franchID = TF.franchID
and [Average Salary] is not null
order by franchName, [Average Salary] desc