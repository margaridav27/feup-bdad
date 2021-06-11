.mode columns
.headers ON

/* 1. */
select hostname, nome
from Servidor join Pessoa on Servidor.idResponsavel =  Pessoa.idPessoa
where vulneravel like 'sim';

/* 2. */
select hostname, descricao, nome
from Servidor join Pessoa on Servidor.idResponsavel = Pessoa.idPessoa
              join AplicacaoServidor on Servidor.idServidor = AplicacaoServidor.idServidor
              join Bug on AplicacaoServidor.idAplicacao = Bug.idAplicacao
where Bug.vulnerabilidade like 'sim'
order by hostname asc; 
      
/* 3. */
select hostname
from Servidor join Pessoa on Servidor.idResponsavel = Pessoa.idPessoa
              join AplicacaoServidor on Servidor.idServidor = AplicacaoServidor.idServidor
              join Bug on AplicacaoServidor.idAplicacao = Bug.idAplicacao 
where mail like 'joao.almeida@cica.pt' and hostname like 'alu%'
group by Servidor.idServidor 
having count(Bug.idBug) >= 1;

/* 4. */
select nome 
from Aplicacao join Bug on Bug.idAplicacao = Aplicacao.idAplicacao
group by Aplicacao.idAplicacao
order by count(Bug.idBug) desc
limit 1;

/* 5. trigger */
drop trigger if exists trigger1;
create trigger trigger1 
after insert on AplicacaoServidor
when exists (select * from Bug
             where vulnerabilidade like 'sim' and
                   Bug.idAplicacao = new.idAplicacao)
begin
    update Servidor set vulneravel = 'sim' 
    where idServidor = new.idServidor;
end;

/* 6. */
drop trigger if exists trigger2;
create trigger trigger2 
after insert on Bug
when New.vulnerabilidade like 'sim'
begin
    update Servidor set vulneravel = 'sim' 
    where idServidor in (select idServidor 
                         from Bug join AplicacaoServidor join Servidor
                         where Bug.idAplicacao = new.idAplicacao and
                               AplicacaoServidor.idAplicacao = Bug.idAplicacao and
                               Servidor.idServidor = AplicacaoServidor.idServidor);
    
    update Bug set prioridade = 1
    where Bug.idBug = new.idBug;
end;