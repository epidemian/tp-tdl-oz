functor
export
   Longitud
   Tomar
   Eliminar
   Agregar
   Miembro
   Posicion
define
   % Devuelve la longitud de la lista Xs.
   fun {Longitud Xs}
      case Xs of nil then 0
      [] _|Xr then 1 + {Longitud Xr}
      end
   end

   % Devuelve una lista con los primeros {Min N {Longitud Xs}} elementos de la
   % lista Xs.
   fun {Tomar Xs N}
      case Xs of nil then nil
      [] X|Xr then
         if N == 0 then nil else X|{Tomar Xr N-1} end
      end
   end

   % Devuelve la lista que resulta de eliminar los primeros
   % {Min N {Longitud Xs}} elementos de la lista Xs.
   fun {Eliminar Xs N}
      case Xs of nil then nil
      [] _|Xr then
         if N == 0 then Xs else {Eliminar Xr N-1} end
      end
   end

   % Devuelve la lista que resulta de concatenar Xs y Ys.
   fun {Agregar Xs Ys}
      case Xs of nil then Ys
      [] X|Xr then X|{Agregar Xr Ys}
      end
   end

   % Verifica si Y pertenece a la lista Xs.
   fun {Miembro Xs Y}
      case Xs of nil then false
      [] X|Xr then X == Y orelse {Miembro Xr Y} end
   end

   % Devuelve la posición de Y en la lista Xs siendo la primer posición la 1.
   fun {Posicion Xs Y}
      case Xs of nil then raise elementoNoPertenece(Y Xs) end
      [] X|Xr then
         if Y == X then 1 else 1 + {Posicion Xr Y} end
      end
   end
end
