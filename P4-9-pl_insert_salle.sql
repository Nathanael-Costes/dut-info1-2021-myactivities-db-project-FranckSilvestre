
CREATE OR REPLACE FUNCTION gds.pl_insert_salle
                           (un_nom VARCHAR(250),
							             un_nb_personnes_max INTEGER) 
						               RETURNS gds.salle AS $$
						  
DECLARE 
    nouvelle_salle gds.salle%ROWTYPE;
BEGIN
    INSERT INTO gds.salle("id", nom, nb_personnes_max, date_creation, date_modification)
	  VALUES (nextval('gds.salle_seq'), un_nom, un_nb_personnes_max, now(), now())
	  RETURNING * INTO nouvelle_salle;
	  RETURN nouvelle_salle;
END;
$$ LANGUAGE plpgsql;


  select * from gds.pl_insert_salle('marguerite', 12);
  select * from gds.pl_insert_salle('geranium', 6);
  select * from gds.pl_insert_salle('laurier', 24);
  select * from gds.pl_insert_salle('bambou', 32);
