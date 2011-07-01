functor
import
   Lista
   Application
   System
define
   proc {AssertEquals Valor Esperado Descripcion}
      if Valor \= Esperado then
	 {System.show 'Fallo en prueba'#Descripcion}
	 {System.show '  Se esperaba: '#Esperado}
	 {System.show '  Pero se obtuvo: '#Valor}
      end      
   end
      
   proc {PruebasLista}
      {System.show 'Lista.longitud'}
      {System.show {Lista.longitud [1 2 3 4]}}
      {System.show 'Lista.tomar'}
      {System.show {Lista.tomar [1 2 3 4] 3}}
      {System.show {Lista.tomar [1 2 3 4] 0}}
      {System.show {Lista.tomar [1 2 3 4] 5}}
      {System.show 'Lista.eliminar'}
      {System.show {Lista.eliminar [1 2 3 4] 3}}
      {System.show {Lista.eliminar [1 2 3 4] 0}}
      {System.show {Lista.eliminar [1 2 3 4] 5}}
      {System.show 'Agrgar'}
      {System.show {Lista.agregar [1 2 3] [4 5]}}
      {System.show {Lista.agregar nil [4 5]}}
      {System.show {Lista.agregar [1 2 3] nil}}
      {System.show 'Lista.miembro'}
      {System.show {Lista.miembro [1 2 3 4] 3}}
      {System.show {Lista.miembro [1 2 3 4] 6}}
      {System.show {Lista.miembro nil 3}}
      {System.show 'Lista.posicion'}
      {System.show {Lista.posicion [1 2 3 4] 3}}
   end
   {PruebasLista}
   {AssertEquals nil [1 2 3] 'Prueba chota'}
   {Application.exit 0}
end

   
