functor
export
   AplicarMovimientos
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
      of uno(N) then P S in
         {AplicarMovimientoEnVia N E.principal E.uno P S}
         estado(principal:P uno:S dos:E.dos)
      [] dos(N) then P S in
         {AplicarMovimientoEnVia N E.principal E.dos P S}
         estado(principal:P uno:E.uno dos:S)
      end
   end
   
   % Calcula el resultado de de mover N vagones desde la vía principal P hacia 
   % la vía secundaria S. El estado final de la vía principal se almacena en P1
   % y el estado final de la vía secundaria se almacena en S1.
   proc {AplicarMovimientoEnVia N P S ?P1 ?S1}
      if N > 0 then L = {Lista.longitud P} - N in
         P1 = {Lista.tomar P L}
         S1 = {Lista.agregar {Lista.eliminar P L} S}
      else
         P1 = {Lista.agregar P {Lista.tomar S ~N}}
         S1 = {Lista.eliminar S ~N}
      end
   end
end
