USE [ventas]
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizaContinente]    Script Date: 07/10/2020 06:03:40 p. m. ******/

CREATE PROCEDURE [dbo].[sp_actualizaContinente]  
  @idcontinente CHAR(1)
AS  
BEGIN 

	UPDATE p SET p.existencia = (existencia - (SELECT sum(NoUnidades) FROM ventas WHERE IdProducto = p.ID))
	FROM productos as p WITH (INDEX (Idx_NC_Continente_Existencia)) 
	INNER JOIN ventas as v WITH (INDEX (Idx_NC_IdProducto_NoUnidades))
	ON (v.IdProducto = p.ID )
	WHERE p.Continente = @idcontinente;


  PRINT 'FINALIZÓ CONTINENTE: '+ @idcontinente;
END






select * from productos as p inner join ventas as v on p.ID=v.idProducto 
	where continente='1';