%% Los parametros de entrada son los string mensaje1 y mensaje 2 
%% Si no se pasan ninguno de los 2 a la funcion devuelve un vector vacion y el mensaje de error
function [msg] = mensaje(selector)  
  
     if strcmp(selector,'mensaje1')
         
         load arch1.mat  % Este archivo debe estar en la misma carpeta que este script
         mensaje=msg1;
         msg= mensaje ;
         
     
     
     elseif strcmp(selector,'mensaje2')
         
         load arch2.mat
         msg= y_rf_tot;
         
     else
         
         fprintf('Parametro incorrecto, vuelva a intentarlo \n')
         msg=''
         
     end
     
end
         
         
         