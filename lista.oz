local
   % Devuelve la longitud de la lista Xs
   fun {Longitud Xs}
      case Xs of nil then 0
      [] _|T then 1 + {Longitud T}
      end
   end

   % Devuelve una lista con los primeros {Min N {Longitud Xs}} elementos de la
   % lista Xs.
   fun {Tomar Xs N}
      case Xs of nil then nil
      [] H|T then
	 if N == 0 then nil else H|{Tomar T N-1} end
      end
   end

   % Devuelve la lista que resulta de eliminar los primeros
   % {Min N {Longitud Xs}} elementos de la lista Xs.
   fun {Eliminar Xs N}
      case Xs of nil then nil
      [] _|T then
	 if N == 0 then Xs else {Eliminar T N-1} end
      end
   end

   % Devuelve la lista que resulta de concatenar Xs y Ys
   fun {Agregar Xs Ys}
      case Xs of nil then Ys
      [] H|T then H|{Agregar T Ys}
      end
   end

   % Verifica si Y pertenece a la lista Xs
   fun {Miembro Xs Y}
      case Xs of nil then false
      [] H|T then H == Y orelse {Miembro T Y} end
   end

   % Devuelve la posición de Y en la lista Xs siendo la primer posición la 0.
   fun {Posicion Xs Y}
      case Xs of nil then raise elementoNoPertenece(Y Xs) end
      [] H|T then
	 if Y == H then 0 else 1 + {Posicion T Y} end
      end
   end
   
in
   {Show 'Longitud'}
   {Show {Longitud [1 2 3 4]}}
   {Show 'Tomar'}
   {Show {Tomar [1 2 3 4] 3}}
   {Show {Tomar [1 2 3 4] 0}}
   {Show {Tomar [1 2 3 4] 5}}
   {Show 'Eliminar'}
   {Show {Eliminar [1 2 3 4] 3}}
   {Show {Eliminar [1 2 3 4] 0}}
   {Show {Eliminar [1 2 3 4] 5}}
   {Show 'Agrgar'}
   {Show {Agregar [1 2 3] [4 5]}}
   {Show {Agregar nil [4 5]}}
   {Show {Agregar [1 2 3] nil}}
   {Show 'Miembro'}
   {Show {Miembro [1 2 3 4] 3}}
   {Show {Miembro [1 2 3 4] 6}}
   {Show {Miembro nil 3}}
   {Show 'Posicion'}
   {Show {Posicion [1 2 3 4] 3}}
end