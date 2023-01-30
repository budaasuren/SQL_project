CREATE TABLE dietary_compositions_by_commodity_group
(
	entity varchar not null,
    code varchar ,
    year_value integer not null,
    other double precision,
    alcohol double precision,
    sugar double precision, 
	oils_fats double precision,
	meat double precision, 
	dairy_eggs double precision,
	fruit_vegetables double precision, 
	starchy_roots double precision, 
	pulses double precision, 
	cereals_grains double precision
)

-- displaying the first 10 rows
select * from dietary_compositions_by_commodity_group limit 10; 

-- replacing null diet portons with zero
update dietary_compositions_by_commodity_group 
    set other=0 where other is null; 
	
update dietary_compositions_by_commodity_group 
    set alcohol=0 where alcohol is null; 

update dietary_compositions_by_commodity_group 
    set sugar=0 where sugar is null; 
	
update dietary_compositions_by_commodity_group 
    set oils_fats=0 where oils_fats is null; 
	
update dietary_compositions_by_commodity_group 
    set meat=0 where meat is null; 
	
update dietary_compositions_by_commodity_group 
    set dairy_eggs=0 where dairy_eggs is null; 
	
update dietary_compositions_by_commodity_group 
    set fruit_vegetables=0 where fruit_vegetables is null; 
	
update dietary_compositions_by_commodity_group 
    set starchy_roots=0 where starchy_roots is null; 
	
update dietary_compositions_by_commodity_group 
    set pulses=0 where pulses is null; 
	
update dietary_compositions_by_commodity_group 
    set cereals_grains=0 where cereals_grains is null; 

-- creating total kilocalories column
alter table dietary_compositions_by_commodity_group add column total_kilocalories double precision; 

update dietary_compositions_by_commodity_group 
set total_kilocalories = t.total_kilocalories 
from (
    select 
	    entity as entity_temp, 
	    year_value as year_value_temp, 
	    other + alcohol + sugar + oils_fats + meat + dairy_eggs + fruit_vegetables + starchy_roots + pulses + cereals_grains as total_kilocalories 
	from dietary_compositions_by_commodity_group
) t 
where entity = t.entity_temp and year_value = t.year_value_temp; 

select * from dietary_compositions_by_commodity_group limit 10; 

-- creating other food category portion in total kilocalories column
alter table dietary_compositions_by_commodity_group add column other_portion double precision; 

update dietary_compositions_by_commodity_group 
set other_portion = t.other_portion 
from (
    select 
	    entity as entity_temp, 
	    year_value as year_value_temp, 
	    other / total_kilocalories as other_portion 
	from dietary_compositions_by_commodity_group
) t 
where entity = t.entity_temp and year_value = t.year_value_temp; 

select * from dietary_compositions_by_commodity_group limit 10; 

-- creating alcohol food category portion in total kilocalories column
alter table dietary_compositions_by_commodity_group add column alcohol_portion double precision; 

update dietary_compositions_by_commodity_group 
set alcohol_portion = t.alcohol_portion 
from (
    select 
	    entity as entity_temp, 
	    year_value as year_value_temp, 
	    alcohol / total_kilocalories as alcohol_portion 
	from dietary_compositions_by_commodity_group
) t 
where entity = t.entity_temp and year_value = t.year_value_temp; 

select * from dietary_compositions_by_commodity_group order by entity, year_value limit 10; 

-- creating sugar food category portion in total kilocalories column
alter table dietary_compositions_by_commodity_group add column sugar_portion double precision; 

update dietary_compositions_by_commodity_group 
set sugar_portion = t.sugar_portion 
from (
    select 
	    entity as entity_temp, 
	    year_value as year_value_temp, 
	    sugar / total_kilocalories as sugar_portion 
	from dietary_compositions_by_commodity_group
) t 
where entity = t.entity_temp and year_value = t.year_value_temp; 

select * from dietary_compositions_by_commodity_group order by entity, year_value limit 10; 

-- creating dairy&eggs food category portion in total kilocalories column
alter table dietary_compositions_by_commodity_group add column dairy_eggs_portion double precision; 

update dietary_compositions_by_commodity_group 
set dairy_eggs_portion = t.dairy_eggs_portion 
from (
    select 
	    entity as entity_temp, 
	    year_value as year_value_temp, 
	    dairy_eggs / total_kilocalories as dairy_eggs_portion 
	from dietary_compositions_by_commodity_group
) t 
where entity = t.entity_temp and year_value = t.year_value_temp; 

select * from dietary_compositions_by_commodity_group order by entity, year_value limit 10; 

-- creating fruit&vegetables food category portion in total kilocalories column
alter table dietary_compositions_by_commodity_group add column fruit_vegetables_portion double precision; 

update dietary_compositions_by_commodity_group 
set fruit_vegetables_portion = t.fruit_vegetables_portion 
from (
    select 
	    entity as entity_temp, 
	    year_value as year_value_temp, 
	    fruit_vegetables / total_kilocalories as fruit_vegetables_portion 
	from dietary_compositions_by_commodity_group
) t 
where entity = t.entity_temp and year_value = t.year_value_temp; 

select * from dietary_compositions_by_commodity_group order by entity, year_value limit 10; 

-- creating starchy roots food category portion in total kilocalories column
alter table dietary_compositions_by_commodity_group add column starchy_roots_portion double precision; 

update dietary_compositions_by_commodity_group 
set starchy_roots_portion = t.starchy_roots_portion 
from (
    select 
	    entity as entity_temp, 
	    year_value as year_value_temp, 
	    starchy_roots / total_kilocalories as starchy_roots_portion 
	from dietary_compositions_by_commodity_group
) t 
where entity = t.entity_temp and year_value = t.year_value_temp; 

select * from dietary_compositions_by_commodity_group order by entity, year_value limit 10; 

-- creating pulses food category portion in total kilocalories column
alter table dietary_compositions_by_commodity_group add column pulses_portion double precision; 

update dietary_compositions_by_commodity_group 
set pulses_portion = t.pulses_portion 
from (
    select 
	    entity as entity_temp, 
	    year_value as year_value_temp, 
	    pulses / total_kilocalories as pulses_portion 
	from dietary_compositions_by_commodity_group
) t 
where entity = t.entity_temp and year_value = t.year_value_temp; 

select * from dietary_compositions_by_commodity_group order by entity, year_value limit 10; 

-- creating cereals&grains food category portion in total kilocalories column
alter table dietary_compositions_by_commodity_group add column cereals_grains_portion double precision; 

update dietary_compositions_by_commodity_group 
set cereals_grains_portion = t.cereals_grains_portion 
from (
    select 
	    entity as entity_temp, 
	    year_value as year_value_temp, 
	    cereals_grains / total_kilocalories as cereals_grains_portion 
	from dietary_compositions_by_commodity_group
) t 
where entity = t.entity_temp and year_value = t.year_value_temp; 

select * from dietary_compositions_by_commodity_group order by entity, year_value limit 10; 

-- creating oils&fats food category portion in total kilocalories column
alter table dietary_compositions_by_commodity_group add column oils_fats_portion double precision; 

update dietary_compositions_by_commodity_group 
set oils_fats_portion = t.oils_fats_portion 
from (
    select 
	    entity as entity_temp, 
	    year_value as year_value_temp, 
	    oils_fats / total_kilocalories as oils_fats_portion 
	from dietary_compositions_by_commodity_group
) t 
where entity = t.entity_temp and year_value = t.year_value_temp; 

select * from dietary_compositions_by_commodity_group order by entity, year_value limit 10; 

-- creating meat food category portion in total kilocalories column
alter table dietary_compositions_by_commodity_group add column meat_portion double precision; 

update dietary_compositions_by_commodity_group 
set meat_portion = t.meat_portion 
from (
    select 
	    entity as entity_temp, 
	    year_value as year_value_temp, 
	    meat / total_kilocalories as meat_portion 
	from dietary_compositions_by_commodity_group
) t 
where entity = t.entity_temp and year_value = t.year_value_temp; 

select * from dietary_compositions_by_commodity_group order by entity, year_value limit 10; 

-- loading table for share of obese adults by country and year
CREATE TABLE share_of_adults_defined_as_obese
(
	entity varchar not null,
    code varchar ,
    year_value integer not null,
    share_obese_adults double precision 
)
select * from share_of_adults_defined_as_obese order by entity, year_value limit 10; 


-- Joining the above two tables to look at the relationship between diet and obesity
create table diet_composition_and_obesity as
select dietary_compositions_by_commodity_group.entity, dietary_compositions_by_commodity_group.code, 
       dietary_compositions_by_commodity_group.year_value, other_portion, alcohol_portion, 
	   sugar_portion, dairy_eggs_portion, fruit_vegetables_portion, starchy_roots_portion, 
	   pulses_portion, cereals_grains_portion, oils_fats_portion, meat_portion, total_kilocalories, share_obese_adults
	from dietary_compositions_by_commodity_group
    inner join share_of_adults_defined_as_obese
	on dietary_compositions_by_commodity_group.entity = share_of_adults_defined_as_obese.entity 
	and dietary_compositions_by_commodity_group.year_value = share_of_adults_defined_as_obese.year_value
	where total_kilocalories is not null and share_obese_adults is not null; 

select * from diet_composition_and_obesity order by entity, year_value limit 10; 





