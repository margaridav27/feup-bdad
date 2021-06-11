.mode columns
.headers ON

/* 1. */
select Estudante.nome 
from Estudante join Amizade on Estudante.ID = Amizade.ID1
where Amizade.ID2 in (select ID
                      from Estudante
                      where nome like 'Gabriel %');

/* 2. */
select E1.nome
from Estudante E1, Estudante E2, Amizade
where E1.ID = Amizade.ID1 and E2.ID = Amizade.ID2 
group by E1.ID
having count(distinct E2.anoCurricular) = 5;

/* 3. */
select distinct A1.ID1, A2.ID2
from Amizade A1, Amizade A2
where A1.ID2 = A2.ID1 and A1.ID1 <> A2.ID2 and not exists (select ID1, ID2
                                                           from Amizade
                                                           where ID1 = A1.ID1 and ID2 = A2.ID2)
order by A1.ID1

/* 4. */
select E1.nome, E2.nome
from Estudante E1, Amizade A, Estudante E2
where E1.ID = A.ID1 and E2.ID = A.ID2 and E1.ID > E2.ID and E1.curso <> E2.curso;

/* trigger que impede atualizações à tabela Amizade */
drop trigger if exists prohibitUpdates;
create trigger prohibitUpdates
before update on Amizade
begin 
    select raise(ignore);
end;

/* trigger que insere a amizade simétrica */
drop trigger if exists insertSymmetricFriendship;
create trigger insertSymmetricFriendship
after insert on Amizade
begin 
    insert into Amizade values (new.ID2, new.ID1);
end;

/* trigger que remove a amizade simétrica */
drop trigger if exists removeSymmetriccFriendship;
create trigger removeSymmetriccFriendship
after delete on Amizade
begin 
    delete from Amizade where ID1 = old.ID1 and ID2 = old.ID2;
end; 