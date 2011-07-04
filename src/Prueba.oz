functor
export
   NuevaPrueba
import
   System
define
   fun {NuevaPrueba}
      Total = {NewCell 0} % Cantidad de pruebas realizadas
      Exitosas = {NewCell 0} % Cantidad de pruebas exitosas
      proc {Iguales Valor Esperado Descripcion}
         if Valor == Esperado then
            Exitosas := @Exitosas + 1
         else
            % show -> con endline. print -> sin endline. 
            % printInfo/showInfo -> sólo strings (no muestran bien las listas)
            {System.showInfo 'Fallo en prueba: '#Descripcion}
            {System.printInfo '  Se esperaba: '} 
            {System.show Esperado}
            {System.printInfo '  Pero se obtuvo: '} 
            {System.show Valor}
         end
         Total := @Total + 1
      end
      proc {Finalizar}
         if @Total == @Exitosas then
            {System.showInfo 'Todas las pruebas pasaron exitosamente!'}
         end
         {System.showInfo 'Pruebas exitosas/total: '#@Exitosas#'/'#@Total}
      end
   in
      prueba(iguales:Iguales finalizar:Finalizar)
   end
end
