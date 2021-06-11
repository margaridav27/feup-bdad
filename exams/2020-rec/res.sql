.mode columns
.headers ON

/* 1. */
select Name, Title, Country
from Speaker join Talk on Speaker.Id = Talk.Speaker
order by Country; 

/* 2. */
select Name
from Speaker join Talk on Speaker.Id = Talk.Speaker
group by Speaker.Id
having count(*) > 1;

/* 3. */
select Name from Topic 
except
select Name from Topic join Talk on Topic.Id = Talk.topic;

/* 3. different approach */
select Name from Topic
where not exists (select * from Talk
                  where topic = Id);

/* 4. */
select Name, count(distinct Talk.Day) as '#days'
from Topic join Talk on Topic.Id = Talk.topic
group by Topic.Id
union 
select Name, 0 as '#days' 
from Topic 
where not exists (select topic from Talk
                  where topic = Topic.Id)
order by Topic.Name;

/* 4. different approach */
select Name, ifnull(count(distinct Talk.day), 0) as '#days'
from Topic left join Talk on Topic.id = Talk.topic
group by Id
order by Name;
