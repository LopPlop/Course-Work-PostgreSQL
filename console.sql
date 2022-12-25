drop role if exists operator;
drop role if exists db_user;
drop role if exists admin;


create table client
(
    client_id serial primary key,
    surname   varchar(30),
    age       integer
);


create table products
(
    product_id          serial primary key,
    name_of_product     varchar(30),
    manufacture_id      integer references manufactures (manucature_id),
    vendor_id           integer references vendors (vendor_id),
    price               integer,
    count_of_product    integer,
    age                 varchar(80)
);


create table sales
(
    sales_id                serial primary key,
    product_id              integer references products (product_id),
    client_id               integer references client (client_id),
    date_of_sale            date
);


create table manufactures
(
    manucature_id serial primary key,
    name          varchar(30),
    city_id       integer references cities (city_id)
);

create table cities
(
    city_id      serial primary key,
    city         varchar(30)
);


create table vendors
(
    vendor_id serial primary key,
    name      varchar(30)
);



create role operator with login password 'operator';
create role db_user with login password 'user';
create role admin with login password 'admin';

grant usage on schema public to operator;
grant usage on schema public to db_user;
grant usage on schema public to admin;

grant all on schema public to admin;
grant all on schema public to operator;
grant all on schema public to db_user;

grant select, usage on all sequences in schema public to operator;
grant select, usage on all sequences in schema public to db_user;
grant all privileges on all sequences in schema public to admin;

grant insert, select, update, delete on cities, manufactures, vendors to operator;
grant insert, select, update, delete on products, sales to db_user;
grant all privileges on all tables in schema public to admin;


insert into cities (city)
values ('Благовещенск'),
       ('Чебоксары'),
       ('Лондон'),
       ('Абергел'),
       ('Далян'),
       ('Гонконг'),
       ('Берлин'),
       ('Мюнхен'),
       ('Ташкент'),
       ('Самарканд'),
       ('Сан-Паулу'),
       ('Рио-де-Жанейро');


insert into manufactures (name, city_id)
values ('ООО «Гознак»', 1),
       ('ОАО «Группа Илим»', 5),
       ('ЗАО «Интернешнл Пейпер»', 1),
       ('АО «МОНДИ СЛПК Коми»', 2),
       ('ЧП «Смерфит Каппа»', 2),
       ('ООО «Маяк Пенза»', 2),
       ('ИП «Пермская Бумажная Фабрика»', 1),
       ('ООО «Bic»', 3),
       ('ОАО «Berlingo»', 3),
       ('ООО «ErichKrause»', 3),
       ('ООО «ProEcoPen»', 4),
       ('ООО «Beifa»', 4),
       ('ООО «Brauberg»', 5),
       ('ООО «Centrum»', 5),
       ('ООО «Pilot»', 6),
       ('ООО «Faber-Castell»', 6),
       ('ООО «Koh-i-Noor»', 4),
       ('ООО «Невская палитра»', 5),
       ('ООО «Crayola»', 1),
       ('ООО «Maped»', 2);


insert into client (surname, age)
values ('Иванов', random()*40+8),
       ('Смирнов',  random()*40+8),
       ('Кузнецов',  random()*40+8),
       ('Попов',  random()*40+8),
       ('Васильев',  random()*40+8),
       ('Петров',  random()*40+8),
       ('Соколов',  random()*40+8),
       ('Михайлов',  random()*40+8),
       ('Новиков',  random()*40+8),
       ('Фёдоров',  random()*40+8),
       ('Морозов',  random()*40+8),
       ('Волков',  random()*40+8),
       ('Алексеев',  random()*40+8),
       ('Лебедев',  random()*40+8),
       ('Семёнов',  random()*40+8),
       ('Егоров',  random()*40+8);


insert into products (name_of_product, manufacture_id, price, count_of_product)
values ('Календари', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Блокноты', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Листовки', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Плакаты', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Буклеты', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Брашюры', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Журналы', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Книги', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Грамоты', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Кубарики', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Папки', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Упаковки', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Визитки', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Открытки', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Бланки', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Билеты', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Планинги', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Каталоги', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Наклейки', random()*19+1, random()*750 + 100,random()*100 + 5),
       ('Атласы', random()*19+1, random()*750 + 100,random()*100 + 5);


insert into vendors (name)
values ('Лазерпринт'),
       ('Атмосфера'),
       ('Mix'),
       ('Лемур'),
       ('Советская Сибирь'),
       ('Центральный'),
       ('Кант'),
       ('Школьник'),
       ('Авантия-принт'),
       ('Принта'),
       ('iPrint'),
       ('АкадемПостер');


insert into sales (client_id, product_id, date_of_sale)
values (random()*15+1, random()*19+1, '2022-06-01'),
       (random()*15+1, random()*19+1, '2022-06-04'),
       (random()*15+1, random()*19+1, '2022-06-10'),
       (random()*15+1, random()*19+1, '2022-06-15'),
       (random()*15+1, random()*19+1, '2022-07-25'),
       (random()*15+1, random()*19+1, '2022-07-21'),
       (random()*15+1, random()*19+1, '2021-02-15'),
       (random()*15+1, random()*19+1, '2021-01-26'),
       (random()*15+1, random()*19+1, '2021-08-12'),
       (random()*15+1, random()*19+1, '2021-09-20'),
       (random()*15+1, random()*19+1, '2021-10-24'),
       (random()*15+1, random()*19+1, '2021-12-01'),
       (random()*15+1, random()*19+1, '2021-11-05'),
       (random()*15+1, random()*19+1, '2021-02-08'),
       (random()*15+1, random()*19+1, '2021-01-14'),
       (random()*15+1, random()*19+1, '2021-03-11'),
       (random()*15+1, random()*19+1, '2021-04-21'),
       (random()*15+1, random()*19+1, '2021-05-21'),
       (random()*15+1, random()*19+1, '2021-02-26'),
       (random()*15+1, random()*19+1, '2021-01-15'),
       (random()*15+1, random()*19+1, '2021-07-14'),
       (random()*15+1, random()*19+1, '2021-09-21'),
       (random()*15+1, random()*19+1, '2021-10-16'),
       (random()*15+1, random()*19+1, '2022-11-19'),
       (random()*15+1, random()*19+1, '2022-10-20'),
       (random()*15+1, random()*19+1, '2020-11-24'),
       (random()*15+1, random()*19+1, '2021-11-28');


/*1)Для каждого вида полиграфической продукции указать сведения о ней
  (наименование, издательство, цена, тираж, и т.п.)*/
select * from products_info();


/*2)Для каждого вида полиграфической продукции получить список, отсортированный:
  в алфавитном порядке по наименованию, по тиражу, по стоимости*/
select * from products_info_ordered_by_name();
select * from products_info_ordered_by_price();
select * from products_info_ordered_by_count();


/*3)Найти самую дорогую полиграфическую продукцию, самую дешевую, среднюю стоимость*/
select * from max_min_avg_price();


/*4)Найти всю полиграфическую продукцию, с ценой выше заданной*/
select * from products_price_more_then(300);


/*5)Найти всю полиграфическую продукцию, чей тираж попадает в заданные интервалы(ввод)*/
select * from products_count_between(20, 50);


/*6)Для заданного издательства(выбор) найти всю полиграфическую продукцию*/
select * from products_by_manufactures('ООО «Маяк Пенза»');


/*7)Найти всю полиграфическую продукцию, чья цена попадает в заданные интервалы и для заданного издательства*/
select * from products_price_between_and_manufactures(150, 900 , 'ЗАО «Интернешнл Пейпер»');


/*Найти всю полиграфическую продукцию, чья цена попадает в заданные интервалы*/
/*select * from products_price_between(200, 600);*/


/*8)Найти долю дешевой полиграфической продукции*/
select products_percentage_price_less_then(500) || '%';


/*9)Найти долю полиграфической продукции, проданной за определенный период*/
select products_percentage_data_between('2021-02-11'::date, '2023-11-11'::date) || '%';


/*10)Найти всю полиграфическую продукцию, поступившую от заданного издателя,
  чья стоимость выше заданной*/
select * from products_price_more_then_and_manufactures(600, 'ООО «Pilot»');


/*11)Найти всю полиграфическую продукцию, поступившую от заданного издательства, чья
  стоимость больше чем средняя стоимость продукции, поступившей из заданного города*/
select * from products_manufacture_city('ООО «Невская палитра»', 'Лондон');


/*12)Найти долю дорогой полиграфической продукции, поступившей от заданного производителя,
  и в целом*/
select * from products_percentage_price_more_then_and_manufactures(600, 'ООО «Pilot»');


/*13)Найти среднюю стоимость продукции, проданной за определенный промежуток времени*/
select products_avg_data_between('2020-02-11'::date, '2022-11-11'::date);


/*14)Найти всю полиграфическую продукцию, чья стоимость выше, чем средняя стоимость
  полиграфической продукции заданного издательства*/
select * from products_price_more_then_avg_in_manufactures('ООО «Pilot»');


/*15)Найти всю полиграфическую продукцию, которую лучше всего раскупают*/
select * from best_saled_products();


/*16)Найти долю полиграфической продукции для заданного возраста
  от общего числа полиграфической продукции*/
select products_percentage_age('для детей') || '%';



select * from Func();

drop function Func();


create or replace function Func()
    returns table(
                    name  varchar(30),
                    price integer,
                    avg_price integer
                 )
as
$$
declare
    avg_price   integer;
BEGIN
    select
        avg(products.price)::integer into avg_price
                                        from products
                            JOIN vendors v on products.vendor_id = v.vendor_id
                            JOIN manufactures m on products.manufacture_id = m.manucature_id
                            where (v.name = 'Лемур' or v.name = 'iPrint') and (m.name = 'ООО «ErichKrause»' or m.name = 'ООО «Maped»');

    return query select
                     products.name_of_product,
                     products.price,
                     avg_price
                                        from products
                        JOIN manufactures m2 on products.manufacture_id = m2.manucature_id
                        JOIN cities c on m2.city_id = c.city_id
                        where (city = 'Лондон' or city = 'Ташкент') and products.price > avg_price;
end;
$$ language plpgsql;




create or replace function products_info_ordered_by_name()
    returns table(
                    name       varchar(30),
                    price      integer,
                    count      integer,
                    age        varchar(100)
                 )
as
$$
begin

    return query select products.name_of_product,
           products.price,
           products.count_of_product,
           products.age
        from products
        order by products.name_of_product;
end;
$$ language plpgsql;

create or replace function products_info_ordered_by_price()
    returns table(
                    name       varchar(30),
                    price      integer,
                    count      integer,
                    age        varchar(100)
                 )
as
$$
begin

    return query select products.name_of_product,
           products.price,
           products.count_of_product,
           products.age
        from products
        order by products.price;
end;
$$ language plpgsql;

create or replace function products_info_ordered_by_count()
    returns table(
                    name       varchar(30),
                    price      integer,
                    count      integer,
                    age        varchar(100)
                 )
as
$$
begin

    return query select products.name_of_product,
           products.price,
           products.count_of_product,
           products.age
        from products
        order by products.count_of_product;
end;
$$ language plpgsql;


create or replace function max_min_avg_price()
returns table(
                max_price       integer,
                min_price       integer,
                avg_price       integer
             )
as
$$
begin
    return query select max(products.price)::integer,
            min(products.price)::integer,
            avg(products.price)::integer
        from products;
end;
$$
language plpgsql;



create or replace function products_info()
    returns table
            (
                name_of_product     varchar(30),
                manufacture         varchar(30),
                vendor              varchar(30),
                price               integer,
                city                varchar(30),
                count_of_product    integer
            )
as
$$
begin
    return query select
                     products.name_of_product,
                     m.name,
                     v.name,
                     products.price,
                     c.city,
                     products.count_of_product
                 from products
                 join manufactures m on m.manucature_id = products.manufacture_id
                 join cities c on c.city_id = m.city_id
                 join vendors v on products.vendor_id = v.vendor_id;
end;
$$ language plpgsql;

drop function products_price_more_then;

create or replace function products_price_more_then(a integer)
    returns table
            (
                product_id          integer,
                name_of_product     varchar(30),
                manufacture_id      integer,
                vendor_id           integer,
                price               integer,
                count_of_product    integer,
                age                 varchar(100)
            )
as
$$
declare
    _a integer;
begin
    select a into _a;
    return query select *
                 from products
                 where products.price > _a;
end;
$$ language plpgsql;

drop function products_price_between;

create or replace function products_price_between(a integer, b integer)
    returns table
            (
                name_of_product     varchar(30),
                price               integer,
                count               integer
            )
as
$$
declare
    _a integer;
    _b integer;
begin
    select a into _a;
    select b into _b;
    return query select
                     products.name_of_product,
                     products.price,
                     products.count_of_product
                 from products
                 where products.price between a and b;
end;
$$ language plpgsql;


create or replace function products_price_between_and_manufactures(a integer, b integer, name text)
    returns table
            (
                product_id          integer,
                name_of_product     varchar(30),
                manufacture_id      integer,
                vendor_id           integer,
                price               integer,
                count_of_product    integer
            )
as
$$
declare
    _a integer;
    _b integer;
    _name text;
begin
    select a into _a;
    select b into _b;
    select name into _name;
    return query select
                     products.product_id,
                     products.name_of_product,
                     products.manufacture_id,
                     products.vendor_id,
                     products.price,
                     products.count_of_product
                 from products
                 JOIN manufactures m on m.manucature_id = products.manufacture_id
                 where products.price between a and b and  m.name = _name;
end;
$$ language plpgsql;

drop function products_count_between;

create or replace function products_count_between(a integer, b integer)
    returns table
            (
                product_id          integer,
                name_of_product     varchar(30),
                manufacture_id      integer,
                vendor_id           integer,
                price               integer,
                count_of_product    integer,
                age                 varchar(100)
            )
as
$$
declare
    _a integer;
    _b integer;
begin
    select a into _a;
    select b into _b;
    return query select *
                 from products
                 where products.count_of_product between a and b;
end;
$$ language plpgsql;


create or replace function products_by_manufactures(_manufact text)
    returns table(
                        name_of_product     varchar(30),
                        price               integer,
                        count_of_product    integer
                 )
as
$$
begin
    return query select
                        products.name_of_product,
                        products.price,
                        products.count_of_product
                        from products
                        JOIN manufactures m on products.manufacture_id = m.manucature_id
                        where m.name = _manufact;
end;
$$ language plpgsql;



create or replace function products_percentage_price_less_then(a integer)
    returns integer
as
$$
declare
    _cheap integer;
    _all integer;
begin
    select count(name_of_product) into _all from products;
    select count(name_of_product) into _cheap from products
        where price < a;

    return round((_cheap::double precision / _all::double precision) * 100);

end;
$$ language plpgsql;



create or replace function products_percentage_data_between(a date, b date)
    returns integer
as
$$
declare
    count integer;
    _all integer;
begin

select count(date_of_sale) into count from sales
        where date_of_sale between a and b;

select count(date_of_sale) into _all from sales;

        return round((count::double precision / _all::double precision) * 100);

end;
$$ language plpgsql;


create or replace function products_price_more_then_and_manufactures(a integer, name text)
    returns table
            (
                name_of_product     varchar(30),
                manufacture         varchar(30),
                price               integer,
                count_of_product    integer
            )
as
$$
declare
    _a integer;
    _name text;
begin
    select a into _a;
    select name into _name;
    return query select
                     products.name_of_product,
                     m.name,
                     products.price,
                     products.count_of_product
                 from products
                 JOIN manufactures m on m.manucature_id = products.manufacture_id
                 where products.price > a and  m.name = _name;
end;
$$ language plpgsql;

drop function products_manufacture_city;

create or replace function products_manufacture_city(_manufact text, _city text)
    returns table
            (
                name_of_product     varchar(30),
                manufuct            varchar(30),
                price               integer,
                avg_price           integer,
                count_of_product    integer
            )
as
$$
declare
    avg_price integer;
begin
    select avg(products.price) into avg_price from products
                                                JOIN manufactures m on m.manucature_id = products.manufacture_id
                                                JOIN cities as c ON m.city_id = c.city_id
                                                where c.city = _city;

    return query select
                     products.name_of_product,
                     m.name,
                     products.price,
                     avg_price,
                     products.count_of_product
                 from products
                 JOIN manufactures m on m.manucature_id = products.manufacture_id
                 JOIN cities as c ON m.city_id = c.city_id
                 where m.name = _manufact and products.price >avg_price;
end;
$$ language plpgsql;


create or replace function products_percentage_price_more_then_and_manufactures(_price integer, _manufact text)
    returns table(
                    expensive      integer,
                    expensive_all  integer
                 )
as
$$
declare
    _expensive_manufact integer;
    _expensive integer;
    _all integer;
begin


select count(products.name_of_product) into _expensive_manufact from products
    JOIN manufactures m on products.manufacture_id = m.manucature_id
    where products.price > _price and m.name = _manufact;


select count(products.name_of_product) into _expensive from products
    where products.price > _price;


select count(products.name_of_product) into _all from products;


return query select round((_expensive_manufact::double precision/_all::double precision)*100)::integer,
       round((_expensive::double precision/_all::double precision)*100)::integer;

end
$$ language plpgsql;



create or replace function products_avg_data_between(date1 date, date2 date)
    returns integer
as
$$
declare
    count integer;
begin

select avg(products.price) into count from products
        join sales s on products.product_id = s.product_id
        where date_of_sale between date1 and date2;

return count;

end;
$$ language plpgsql;


create or replace function products_price_more_then_avg_in_manufactures(manufact text)
    returns table
            (
                product_id          integer,
                name_of_product     varchar(30),
                manufacture_id      integer,
                vendor_id           integer,
                price               integer,
                avg_prc             integer
            )
as
$$
declare
        avg_price integer;
begin

select avg(products.price) into avg_price from products
                                JOIN manufactures m on m.manucature_id = products.manufacture_id
                                where m.name = manufact;


    return query select
                     products.product_id,
                     products.name_of_product,
                     products.manufacture_id,
                     products.vendor_id,
                     products.price,
                     avg_price
                 from products
                 where products.price > avg_price;
end;
$$ language plpgsql;


create or replace function best_saled_products()
    returns table
            (
                product             varchar(30),
                manufacture         varchar(30),
                vendor              varchar(30),
                price               integer,
                count_of_sales    integer
            )
as
$$
begin
    return query select
                     products.name_of_product,
                     m.name,
                     v.name,
                     products.price,
                     count(products.name_of_product)::integer as count_of_products
                 from products
                 JOIN sales s on products.product_id = s.product_id
                 JOIN manufactures m on m.manucature_id = products.manufacture_id
                 JOIN vendors v on products.vendor_id = v.vendor_id
                    group by s.product_id,
                             products.product_id,
                             m.manucature_id,
                             v.vendor_id
                    order by count_of_products desc
                    limit 4;

end;
$$ language plpgsql;


create or replace function products_percentage_age(_age text)
    returns integer
as
$$
declare
    count integer;
    _all integer;
begin

select count(name_of_product) into count from products
        where products.age = _age;

select count(name_of_product) into _all from products;

        return round((count::double precision / _all::double precision) * 100);

end;
$$ language plpgsql;