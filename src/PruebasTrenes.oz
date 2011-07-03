functor
import
   Trenes
   Prueba
   Application
define

   % Pruebas del módulo Trenes.
   P = {Prueba.nuevaPrueba}
   
   E = estado(principal:[a b] uno:nil dos:nil)
   {P.iguales {Trenes.aplicarMovimientos E nil} [E] 
              'AplicarMovimientos sin movimientos'}
   
   {P.iguales {Trenes.aplicarMovimientos E [uno(1) dos(1) uno(~1)]}
               [estado(principal:[a b] uno:nil dos:nil)
                estado(principal:[a] uno:[b] dos:nil)
                estado(principal:nil uno:[b] dos:[a])
                estado(principal:[b] uno:nil dos:[a])]
               'AplicarMovimientos con movimientos de 1 vagon'}

   {P.iguales {Trenes.aplicarMovimientos E [uno(1) uno(1) uno(~1) uno(~1)]}
               [estado(principal:[a b] uno:nil dos:nil)
                estado(principal:[a] uno:[b] dos:nil)
                estado(principal:nil uno:[a b] dos:nil)
                estado(principal:[a] uno:[b] dos:nil)
                estado(principal:[a b] uno:nil dos:nil)]
               'AplicarMovimientos: los vagones deben agregarse al comienzo de'#
               ' las vías secundarias y al final de la principal'}

   {P.finalizar}
   {Application.exit 0}
end

   
