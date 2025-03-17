-- making the final dataset and checking for duplicates
WITH bike_share_data as
(
	select dteday, season, b.yr, mnth, hr, rider_type, riders, price, COGS from bike_share_yr_0 b inner join cost_table c on b.yr = c.yr
	UNION ALL
	select dteday, season, b.yr, mnth, hr, rider_type, riders, price, COGS from bike_share_yr_1 b inner join cost_table c on b.yr = c.yr 
)
select *, COUNT(*) from bike_share_data
group by dteday, season, yr, mnth, hr, rider_type, riders, price, COGS
having count(*) > 1;

--removing duplicates as they are unecessary
--this can be done using 'UNION' instead of 'UNION ALL'
WITH bike_share_data as
(
	select dteday, season, b.yr, weekday, mnth, hr, rider_type, riders, price, COGS from bike_share_yr_0 b inner join cost_table c on b.yr = c.yr
	UNION
	select dteday, season, b.yr, weekday, mnth, hr, rider_type, riders, price, COGS from bike_share_yr_1 b inner join cost_table c on b.yr = c.yr 
)
select * FROM bike_share_data;

-- now this query can be used in POWER BI
