functor
import
   Lista
   Prueba
   Application
define

   % Pruebas del módulo Lista.
   P = {Prueba.nuevaPrueba}
   L = [1 2 3 2 1]
   
   {P.iguales {Lista.longitud L} 5 'Longitud de lista'}
   
   {P.iguales {Lista.tomar L 3} [1 2 3] 'Tomar con N < Longitud'}
   {P.iguales {Lista.tomar L 0} nil 'Tomar con N == 0'}
   {P.iguales {Lista.tomar L 6} L 'Tomar con N > Longitud'}
   
   {P.iguales {Lista.eliminar L 3} [2 1] 'Eliminar con N < Longitud'}
   {P.iguales {Lista.eliminar L 0} L 'Eliminar con N == 0'}
   {P.iguales {Lista.eliminar L 6} nil 'Eliminar con N > Longitud'}
   
   {P.iguales {Lista.agregar [1 2 3] [2 1]} L 'Agregar listas no nulas'}
   {P.iguales {Lista.agregar L nil} L 'Agregar nil'}
   {P.iguales {Lista.agregar nil L} L 'Agregar a nil'}
   
   {P.iguales {Lista.miembro L 3} true 'Miembro: elemento pertenece'}
   {P.iguales {Lista.miembro L 0} false 'Miembro: elemento no pertence'}
   {P.iguales {Lista.miembro nil 3} false 'Miembro: lista vacía'}
   
   {P.iguales {Lista.posicion L 1} 1 'Posición de primer elemento es 1'}
   {P.iguales {Lista.posicion L 3} 3 'Posición de tercer elemento es 3'}

   {P.finalizar}
   {Application.exit 0}
end

   
