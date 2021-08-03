select *
from jcostilla.pfcars c1
where c1.caid in (
    select caid
    from jcostilla.pfcars c2
    where c1.cacity = c2.cacity 
    and c1.castat = c2.castat
    order by cadebt desc
    limit 1)