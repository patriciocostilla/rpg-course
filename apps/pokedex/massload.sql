-- PKPOKE
delete from rsoft2.pkpoke;

insert into rsoft2.pkpoke(pkid, pkname, pkheig, pkwgt, pkclr, pklgnd)
select pok.poid, pok.poiden, pok.poheig, pok.poweig, clr.clname, pks.psileg
from rsoft2.pkipok pok, rsoft2.pkipks pks, rsoft2.pkiclr clr
where pok.pospid = pks.psid and pks.pscoid = clr.clid;

update rsoft2.pkpoke
set pkupts = '0001-01-01', pkdlts = '0001-01-01';

-- PKTYPE
delete from rsoft2.pktype;

insert into rsoft2.pktype(tyid, tyname)
select ptid, ptiden 
from rsoft2.pkityp;

update rsoft2.pktype
set tyupts = '0001-01-01', tydlts = '0001-01-01';

-- PKPKTY
delete from rsoft2.pkpkty;

insert into rsoft2.pkpkty(ptidpk, ptidty, ptslot)
select pptpid, ppttid, pptslt
from rsoft2.pkipkt;

update rsoft2.pkpkty
set ptupts = '0001-01-01', ptdlts = '0001-01-01';
