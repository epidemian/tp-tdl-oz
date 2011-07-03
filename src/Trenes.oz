functor
export
   AplicarMovimientos
   CalcularMovimientos
   PartirTren
import
   Lista
define
   % Devuelve la lista de los estados que resulta de aplicar los movimientos Ms
   % a partir del estado inicial E.
   fun {AplicarMovimientos E Ms}
      case Ms of nil then [E]
      [] M|Mr then E1 = {AplicarMovimiento E M} in
         E|{AplicarMovimientos E1 Mr}
      end
   end
   
   % Devuelve el estado que resulta de aplicar el movimiento M al estado E.
   fun {AplicarMovimiento E M}
      case M 
      of uno(N) then E1 = {AplicarMovimientoEnVia N E.principal E.uno} in
         estado(principal:E1.1 uno:E1.2 dos:E.dos)
      [] dos(N) then E1 = {AplicarMovimientoEnVia N E.principal E.dos} in
         estado(principal:E1.1 uno:E.uno dos:E1.2)
      end
   end
   
   % Devuelve el resultado de mover N vagones desde la vía principal P hacia 
   % la vía secundaria S. El resultado es una tupla de la forma
   % <vagones en la vía principal>#<vagones en la vía secundaria>.
   fun {AplicarMovimientoEnVia N P S}
      if N > 0 then L = {Lista.longitud P} - N in
         {Lista.tomar P L}#{Lista.agregar {Lista.eliminar P L} S}
      else
         {Lista.agregar P {Lista.tomar S ~N}}#{Lista.eliminar S ~N}
      end
   end
   
   fun {CalcularMovimientos Xs Ys}
      case Xs#Ys 
      of nil#nil then nil
      [] (X|Xr)#(X|Yr) then
         % Si el primer vagón ya está en la posición esperada paso al siguiente
         {CalcularMovimientos Xr Yr}
      [] (!Xs)#(Y|Yr) then 
         Particion = {PartirTren Xs Y}
         HaciaUno = {Lista.longitud Particion.2} + 1
         HaciaDos = {Lista.longitud Particion.1}
         Xr = {Lista.agregar Particion.2 Particion.1}
      in
         uno(HaciaUno)
            |dos(HaciaDos)
            |uno(~HaciaUno)
            |dos(~HaciaDos)
            |{CalcularMovimientos Xr Yr}
      end
   end
   
   % Devuelve la tupla que resulta de partir el tren Xs por el vagón Y. La tupla
   % resultante tiene la forma: <vagones previos a Y>#<vagones posteriores Y>.
   fun {PartirTren Xs Y}
      Pos = {Lista.posicion Xs Y}
   in
      {Lista.tomar Xs Pos-1}#{Lista.eliminar Xs Pos}
   end
end
