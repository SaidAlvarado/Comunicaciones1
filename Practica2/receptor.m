% %%
% [A1,B1,C1,D1,E1]=receptor(estaciones,49000,3360,1120,1120);
% [A,B,C,D,E]=receptor(estaciones,34000,1680,560,560);

function [A,B,C,D,E]= mensaje(msgRF,fLO,freqdev,WIF,W)
close all
Fs=110250;
t=-3.7415:1/Fs: 3.7415 -1/110250;

FI=14000;

%% Punto A (Pasando la señal por el receptor Rf)

  fc=fLO-FI;
  fc1=fc-W/2;  %% Puede que tenga dividir W entre 2
  fc2=fc+W/2;
  
  [A1,B1]=butter(6,[2*fc1/Fs, 2*fc2/Fs],'bandpass');
  fvtool(A1,B1); 
  A = filter(A1,B1,msgRF);
  
  
 %% Punto B (Señal pasada por el mezclador )
 
 oscilador=cos(2*pi*fLO*t);
 
 B=A.*oscilador;
 
 %% Punto C (Señal de salida del IF )
 
 fic1=FI-WIF/2;
 fic2=FI+WIF/2;
 
 % Normalizacion de las frecuencias para el filtro
 
 Wn=[2*fic1/Fs, 2*fic2/Fs];
 
 [A2,B2]=butter(7,Wn,'bandpass');
 fvtool(A2,B2); 
 C=filter(A2,B2,B);
 
 %% Punto D (salida del demodulador )
 % El demodulador consiste en una señal que oscila a la frecuencia fc 
 % PAra este caso no usaremos la tecnica del filtro sino la funcion de
 % demodular de matlab
 %demodulador=cos(2*pi*fc*t);
  D=fmdemod(C,fc,Fs,freqdev);
 
 %% Punto E (mensaje original)
 
 % La salida del demodulador se pasa por un filtro pasabajo 
 
 [A3,B3]=butter(10,2*W/Fs,'low');
 
 E=filter(A3,B3,D);
 
 % Aqui termina la creacion de las señales 
 
 
end 
 
 
 
 
 
 
 
 
 
 
 
 
 
