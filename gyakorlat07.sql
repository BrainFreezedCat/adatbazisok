/*1. Készítsünk nézetet VSZOBA néven, amely megjeleníti a szobák adatai mellett a megfelelő szálláshely nevét, helyét és a csillagok számát is!

Az oszlopoknak nem szükséges külön nevet adni!
Teszteljük is a nézetet, pl: SELECT * FROM UJAENB_VSZOBA*/


/*2 Készítsen tárolt eljárást SPUgyfelFoglalasok, amely a paraméterként megkapott ügyfél azonosítóhoz tartozó foglalások adatait listázza!
Teszteljük a tárolt eljárás működését, pl: EXEC UJAENB_SPUgyfelFoglalasok 'laszlo2'
*/
create Proc SPUgyfelFoglalasok
@Ugyfel nvarchar(100)
as  
begin 
	select *
    from foglalas 
    where ugyfel_fk = @ugyfel
END 
/*
3. Készítsen skalár értékű függvényt UDFFerohely néven, amely visszaadja, hogy a paraméterként megkapott foglalás azonosítóhoz hány férőhelyes szoba tartozik!
a. Teszteljük a függvény működését!
*/
create or ALTER function UDFFerohely
(
  @fid int
 )
 
 RETURNS int 
 as 
 
 begin 
 DECLARE @Ferohely int 
 select @ferohely = sz.FEROHELY
 from foglalas f join szoba sz on f.SZOBA_FK = sz.SZOBA_ID
 	RETURN @Ferohely 
 END 
