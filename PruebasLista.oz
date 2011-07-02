functor
import
   Lista
   Application
   System
define
   proc {Iguales Valor Esperado Descripcion}
      if Valor \= Esperado then
         % show: con endline. print: sin endline. 
         % printInfo/showInfo -> sólo strings (no muestran bien las listas)
	 {System.showInfo 'Fallo en prueba: '#Descripcion}
	 {System.printInfo '  Se esperaba: '} {System.show Esperado}
	 {System.printInfo '  Pero se obtuvo: '} {System.show Valor}
      end      
   end
   
   L = [1 2 3 2 1]
   
   {Iguales {Lista.longitud L} 5 'Longitud de lista'}
   
   {Iguales {Lista.tomar L 3} [1 2 3] 'Tomar con N < Longitud'}
   {Iguales {Lista.tomar L 0} nil 'Tomar con N == 0'}
   {Iguales {Lista.tomar L 6} L 'Tomar con N > Longitud'}
   
   {Iguales {Lista.eliminar L 3} [2 1] 'Eliminar con N < Longitud'}
   {Iguales {Lista.eliminar L 0} L 'Eliminar con N == 0'}
   {Iguales {Lista.eliminar L 6} nil 'Eliminar con N > Longitud'}
   
   {Iguales {Lista.agregar [1 2 3] [2 1]} L 'Agregar listas no nulas'}
   {Iguales {Lista.agregar L nil} L 'Agregar nil'}
   {Iguales {Lista.agregar nil L} L 'Agregar a nil'}
   
   {Iguales {Lista.miembro L 3} true 'Miembro: elemento pertenece'}
   {Iguales {Lista.miembro L 0} false 'Miembro: elemento no pertence'}
   {Iguales {Lista.miembro nil 3} false 'Miembro: lista vacía'}
   
   {Iguales {Lista.posicion L 1} 0 'Posición de primer elemento es 0'}
   {Iguales {Lista.posicion L 3} 2 'Posición de tercer elemento es 2'}

   {Application.exit 0}
end

   
