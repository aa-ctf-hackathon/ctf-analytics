use role USERADMIN;
create user aa_pradeep_chamarthi password='abc!23' default_role = prod_usr_de_rl must_change_password = true;
create user aa_sidharth_kunnath password='abc!23' default_role = prod_usr_de_rl must_change_password = true;
create user aa_craig_cargile password='abc!23' default_role = prod_usr_de_rl must_change_password = true;
create user aa_abhijit_tilak password='abc!23' default_role = prod_usr_de_rl must_change_password = true;
create user aa_lakshmi_seralaathan password='abc!23' default_role = prod_usr_de_rl must_change_password = true;

grant role prod_usr_de_rl to user aa_pradeep_chamarthi;
grant role prod_usr_de_rl to user aa_sidharth_kunnath;
grant role prod_usr_de_rl to user aa_craig_cargile;
grant role prod_usr_de_rl to user aa_abhijit_tilak;
grant role prod_usr_de_rl to user aa_lakshmi_seralaathan;