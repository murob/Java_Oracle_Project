create table phonebook_tb (
    idx varchar2(50), 
    name varchar2(30) primary key,
    phone varchar2(30),
    birthday varchar2(30) 
);

create sequence seq_phonebook
    increment by 1      
    start with 100      
    minvalue 99         
    maxvalue 110        
    cycle               
    nocache;
select * from phonebook_tb;
drop table phonebook_tb;