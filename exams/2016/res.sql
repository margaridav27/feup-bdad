.mode columns
.headers ON

/* 1. */
select Estudante.nome, Curso.nome
from Estudante join Curso on Estudante.curso = Curso.ID
where anoCurricular = 3;

/* 2. */
select distinct Estudante.nome
from Estudante join Amizade A1 on Estudante.ID = A1.ID1
where (select count(*) from Amizade A2 where A1.ID1 = A2.ID1) > 3;

/* 3. */
select distinct nome, anoCurricular
from Estudante E1 join Amizade on E1.ID = Amizade.ID1
where not exists (select * from Amizade join Estudante E2 on Amizade.ID2 = E2.ID
                  where E1.ID = Amizade.ID1 and E1.anoCurricular <> E2.anoCurricular)
order by anoCurricular asc, nome asc;

/* 4. */
select distinct E4.ID
from Estudante E1, Amizade A1, Estudante E2, Amizade A2, Estudante E3, Amizade A3, Estudante E4
where E1.ID = A1.ID1 and 
      A1.ID2 = E2.ID and 
      E2.ID = A2.ID1 and 
      A2.ID2 = E3.ID and 
      E3.ID = A3.ID1 and 
      A3.ID2 = E4.ID and 
      E1.nome = 'Miguel Sampaio';

/* 4. different approach */
select distinct A3.ID2
from Amizade A1, Amizade A2, Amizade A3
where A1.ID1 in (select Estudante.ID 
                 from Estudante 
                 where Estudante.nome = "Miguel Sampaio") 
      and A1.ID2 = A2.ID1 
      and A2.ID2 = A3.ID1;

/* 5. */
select Estudante.nome, Estudante.anoCurricular
from Estudante join Amizade on Estudante.ID = Amizade.ID1
group by Estudante.ID
order by count(*) desc
limit 1;

/* trigger são iguais ao exame 2016 recurso */
