functor
import
   Trenes
   Visualizador
define
   Inicial = [a b c]
   Final = [b a c]
   Ms = {Trenes.calcularMovimientos Inicial Final}
   Estados = {Trenes.aplicarMovimientos estado(principal:Inicial uno:nil dos:nil)
                                        Ms}
   {Visualizador.visualizar Estados}
end
