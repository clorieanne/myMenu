create table menu 
(
 menuid int primary key,
 menuname text,
 menucost text
);

--controller

create or replace

function addmenu(p_menuid int, p_menuname text, p_menucost text)
  returns text as
$$

  declare 
  v_menuid int;
  begin
  select into v_menuid menuid from menu
  where menuid = p_menuid;


  if v_menuid isnull then
  insert into menu(menuid, menuname, menucost) 
  values (p_menuid, p_menuname, p_menucost);
  else
  update menu
  set menuname = p_menuname
  where menuid = p_menuid;

  update menu
  set menucost = p_menucost
  where menuid = menuid;
  end if;
  return 'OK';
  end;

$$
  language 'plpgsql';
--How to Use;
--SELECT * from addmenu(menuid, menuname, menucost)
--view

create or replace function
  get_menu_perid(in int, out text, out text)
returns setof record as

$$
  select menuname, menucost from menu 
where menuid = $1;
$$
language 'sql';


--select * from addmenu(1, Pork Sinigang, 315)
--select * from addmenu(2, Fish Sinigang, 345)
--select * from addmenu(3, Prawn, 395)
--select * from addmenu(4, Adobo, 315)
--select * from addmenu(5, Tinolang Manok, 315)
--select * from addmenu(6, Bulalo Soup, 395)
--select * from addmenu(7, Crispy Pat, 595)
--select * from addmenu(8, Pancit Canton, 195)
--select * from addmenu(9, Bicol Express, 315)
--select * from addmenu(10, Bistik Tagalog, 315)
