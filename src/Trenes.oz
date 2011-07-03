functor
export
   Maniobrar
   AplicarMovimientos
   CalcularMovimientos
   PartirTren
import
   Lista
define

   % Devuelve una lista de estados por los que tiene que pasar la playa de 
   % maniobras para pasar del estado
   % estado(principal:Xs uno:nil dos:nil) a
   % estado(principal:Ys uno:nil dos:nil)
   fun {Maniobrar Xs Ys}
      Ms = {CalcularMovimientos Xs Ys}
      E = estado(principal:Xs uno:nil dos:nil)
   in
      {AplicarMovimientos E Ms}
   end

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
   
   % Devuelve el resultado de mover N vagones desde el tren en la vía principal 
   % Ps hacia el tren en la vía secundaria Ss. El resultado es una tupla de la 
   % forma <tren en la vía principal>#<tren en la vía secundaria>.
   fun {AplicarMovimientoEnVia N Ps Ss}
      if N > 0 then L = {Lista.longitud Ps} - N in
         {Lista.tomar Ps L}#{Lista.agregar {Lista.eliminar Ps L} Ss}
      else
         {Lista.agregar Ps {Lista.tomar Ss ~N}}#{Lista.eliminar Ss ~N}
      end
   end
   
   % Devuelve la lista de movimientos necesarios para transformar el estado
   % estado(principal:Xs uno:nil dos:nil) en 
   % estado(principal:Ys uno:nil dos:nil)
   fun {CalcularMovimientos Xs Ys}
      case Ys of nil then nil
      [] Y|Yr then
         Particion = {PartirTren Xs Y}
         HaciaUno = {Lista.longitud Particion.2} + 1
         HaciaDos = {Lista.longitud Particion.1}
         % Los primeros tres movimientos dejan Y en la vía principal y el resto
         % de los vagones en las vías uno y dos.
         Ms = uno(HaciaUno)
              |dos(HaciaDos)
              |uno(~1)
              |{CalcularMovimientosUnoYDos Particion.2 Particion.1 Yr}
      in
         {ComprimirMovimientos Ms}
      end
   end
   
   fun {CalcularMovimientosUnoYDos Us Ds Ys}
      case Ys of nil then nil
      [] Y|Yr then Particion L U1s D1s in
         if {Lista.miembro Us Y} then
            Particion = {PartirTren Us Y}
            L = {Lista.longitud Particion.1}
            U1s = Particion.2
            D1s = {Lista.agregar Particion.1 Ds}
            uno(~L)|dos(L)|uno(~1)|{CalcularMovimientosUnoYDos U1s D1s Yr}
         elseif {Lista.miembro Ds Y} then
            Particion = {PartirTren Ds Y}
            L = {Lista.longitud Particion.1}
            U1s = {Lista.agregar Particion.1 Us}
            D1s = Particion.2
            dos(~L)|uno(L)|dos(~1)|{CalcularMovimientosUnoYDos U1s D1s Yr}
         end
      end
   end
   
   fun {ComprimirMovimientos Ms}
      Ns = {EliminarMovimientosRepetidos {EliminarMovimientosNulos Ms}}
   in
      if Ns == Ms then Ms else {ComprimirMovimientos Ns} end
   end
   
   fun {EliminarMovimientosNulos Ms} 
      case Ms of nil then nil
      [] uno(0)|Mr then {EliminarMovimientosNulos Mr}
      [] dos(0)|Mr then {EliminarMovimientosNulos Mr}
      [] M|Mr then M|{EliminarMovimientosNulos Mr}
      end
   end
   
   fun {EliminarMovimientosRepetidos Ms} 
      case Ms of nil then nil
      [] uno(N)|uno(M)|Mr then uno(N + M)|{EliminarMovimientosRepetidos Mr}
      [] dos(N)|dos(M)|Mr then dos(N + M)|{EliminarMovimientosRepetidos Mr}
      [] M|Mr then M|{EliminarMovimientosRepetidos Mr}
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
