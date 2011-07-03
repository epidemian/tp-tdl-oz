functor
import
   Trenes
   Visualizador
define
   Inicial = [a b c d e f g]
   Final = [c f a e g b d]
   {Visualizador.visualizar {Trenes.maniobrar Inicial Final}}
end
