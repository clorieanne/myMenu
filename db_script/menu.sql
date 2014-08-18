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
  insert into addmenu(menuid, menuname, menucost) values (p_menuid, p_menuname, p_menucost)

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
  language 'plpgsql'
--How to Use;
--SELECT addmenu(menuid, menuname, menucost)
--view

create or replace function
  get_menu_perid(in int, out text, out text)
returns setof record as

$$
  select menuid, menuname, menucost from menu 
where menuid = $1;
$$
  language 'sql'
