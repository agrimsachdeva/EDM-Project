create procedure CalculateGeoDistance(
	@longitude varchar(20),
	@latitude varchar(20)
)
as
begin
--declare @h geography
--SET @h = geography::STGeomFromText('POINT('+  @longitude + ' ' + @latitude + ')', 4326);
--select ICIS_FACILITY_INTEREST_ID, FACILITY_NAME, LOCATION_ADDRESS,
--	GEO_Location.STDistance(@h) as Distance_Meters
--	from FACILITY
--	WHERE GEOCODE_LATITUDE is not null
--	order by Distance_Meters


	
DECLARE @h geography;

SET @h = geography::STPointFromText('POINT(74.1790 40.7420)', 4326);

SELECT top 5 mine_id, curr_mine_nm, oper_nm, nearest_town, state_abbr, (geoLocation.STDistance(@h)) as distance

from mhsa_mine

order by distance;



end