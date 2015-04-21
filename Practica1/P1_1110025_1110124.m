% Laboratorio 1:  Modulacion SSB


%%%%%%%%%%%%%%%% Definimos X(t) %%%%%%%%%%%%%%%%%%%%%%%%%%%5 
%Generamos la base de tiempo
Fs = 1000*16
t = -4/16:1/Fs:4/16;
%Definimos la señal triangular que es el mensaje.
Xt = 2*sawtooth(2*pi*16*t,0.5);
%Graficamos en espectro de tiempo
figure(1); plot(t,Xt); title('2a1) Señal mensaje en tiempo, antes de modular'); xlabel('t'); ylabel('X(t)');grid();

%Calculamos la potencia en tiempo (usando una integral discreta, como promedio de la energia,area bajo la curva):
potencia_tiempo = sum(abs(Xt).^2)/length(t)



%%%%%%%%%%%%%% Transformada de fourier de X(t). %%%%%%%%%%%%%%%%%%%%%
N = length(Xt);
%Calculamos la transformada de fourier corrida y reescalada.
AbsXf = abs(fftshift(fft(Xt)))/N;
%Generamos el eje X de la grafica.
f = linspace(-Fs/2,Fs/2,length(AbsXf));
%Graficamos en funcion de la frecuencia
figure(2); plot(f,AbsXf); axis([-100 100 0 1]); title('2a2) Señal mensaje en frecuencia, antes de modular'); xlabel('f'); ylabel('X(f)');grid();

%Calculamos la potencia en el dominio de la frecuencia
potencia_frec = sum(AbsXf.^2)/3

%Calculamos el ancho de banda. Usando un detector de minimos.
%Declaramos variables auxiliares. Valles guardara la cantidad de minimos
%que hemos encontrado. BW guarda el valor en el que se encuentra el tercer
%minimo
valles = 0;
BW = 0;

%Recorremos la funcion de la magnitud del espectro de la señal mensajem
%desde la mitad hacia arriba
for a = ((round(length(AbsXf)/2))+1):length(AbsXf)
    
    %Si el punto en el que estamos es menor que los puntos alrededor de el.
    %Es un minimo
    if (AbsXf(a-1) > AbsXf(a)) && (AbsXf(a+1) > AbsXf(a))
        %Registramos que pasamos por un valle
        valles = valles + 1;
    end
    
    %Cuando pasemos por 3 valles, registramos en que punto de la base de
    %frecuencia se encuentra el tercer valle.
    if valles == 3
        BW = f(a);
        break
    end
    
end
%Imprimimos el resultado.
mensaje = ['El ancho de banda es = ', num2str(BW),'Hz'] ;
disp(mensaje)






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5 Modulando en SSB. %%%%%%%%%%%%5%%%%%%%%%%%%%%%%%%%%%5

% 2.d)Desfasando 90 grados con la transformada de Hilbert.

%Transformada de Hilbert
XHilbert = (hilbert(Xt) - Xt)/i;
%Transformada de Hilbert (Espectro)
AbsXHilbert = abs(fftshift(fft(XHilbert)))/length(XHilbert);
%Grficamos
figure(3); plot(t,XHilbert); axis([-0.25 0.25 -2 2]); title('2d1) Señal mensaje en tiempo, desfasado 90 grados con la transformada de Hilbert'); xlabel('t'); ylabel('XHilbert(t)');grid();
figure(4); plot(f,AbsXHilbert); axis([-100 100 0 1]); title('2d2) Señal mensaje en frecuencia, desfasado 90 grados con la transformada de Hilbert'); xlabel('f'); ylabel('XHilbert(f)');grid();


%2.e) 

%Componente en Fase (Punto rosado)
XssbFase = (5/2).*Xt.*cos(500*2*pi.*t);
figure(5); plot(t,XssbFase);  axis([-0.01 0.01 -5 5]) ; title('2e1) Señal multiplicado por el oscilador local sin desfase'); xlabel('t'); ylabel('Ac/2 x(t)cos(wt)');grid();

XssbFaseF =abs( fftshift( fft(XssbFase) ) )/length(XssbFase);
figure(6); plot(f,XssbFaseF) ; axis([-1000 1000 0 1]) ; title('2e2) Señal multiplicado por el oscilador en frecuencia'); xlabel('f'); ylabel(' (Ac/2pi)x(w)*cos(wt)');grid();


% 2.f)


%Componente en Cuadratura
XssbQuad = (5/2).*XHilbert.*sin(500*2*pi*t); 
figure(7) ; plot(t,XssbQuad); axis([-0.05 0.05 -5 5]) ;title('2f1) Señal desfasada   multiplicado por el oscilador local desfasado  '); xlabel('t'); ylabel('Ac/2 Xhilbert(t)sen(wt)');grid();

XssbQuadF = abs(fftshift( fft(XssbQuad) ) )/length(XssbQuad);
figure(8) ; plot(f,XssbQuadF); axis([-800 800 0 1]) ;title('2f2) Señal desfasada multiplicado por el oscilador local desfasado '); xlabel('f'); ylabel('(Ac/2pi) Xhilbert(w)*sen(wt)');grid();

%2.g)

%La senal modulada en en SSB es:
Xssb = XssbFase - XssbQuad;
figure(8); plot(t,Xssb);  axis([-0.025 0.025 -5 5]) ;title('2e1) Señal modulada xssb(t) '); xlabel('t'); ylabel('xssb(t)');grid();

%Espectro de la senal modulada Lssb:
NssbU = length(Xssb);
AbsXssbfU = abs(fftshift(fft(Xssb)))/NssbU;
f2 = linspace(-Fs/2,Fs/2,length(AbsXssbfU));
figure(9); plot(f2,AbsXssbfU); axis([-700 700 0 2.5]); title('2e2) Señal modulada xssb(w) en frecuencia '); xlabel('f'); ylabel('xssb(w)');grid();


%2.h) Calculo del ancho de banda despues de modular

%%%  Ver como inventamos el calculo

% 2.i) Calculo de la potencia despues de modular 

%% Se realiza un integral discreta que proporciona la energia debajo de la curva y se divide entre el numero de puntos 
potencia_ssb = sum(abs(Xssb).^2)/length(t)

%Demodulador
Xdem = Xssb.*cos(500*2*pi*t);
Xdem = filter(Filtro,Xdem);

figure(9); plot(t,Xdem);



