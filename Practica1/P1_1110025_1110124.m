% Laboratorio 1:  Modulacion SSB


%%%%%%%%%%%%%%%% Definimos X(t) %%%%%%%%%%%%%%%%%%%%%%%%%%%5
%Generamos la base de tiempo
frecuencia_mensaje = 16;
Fs = 1000*frecuencia_mensaje;
t = -4/16:1/Fs:4/16;
%Definimos la se�al triangular que es el mensaje.
Xt = 2*sawtooth(2*pi*frecuencia_mensaje*t,0.5);
%Graficamos en espectro de tiempo
figure(1); plot(t,Xt); title('2a1) Se�al mensaje en tiempo, antes de modular'); xlabel('t'); ylabel('X(t)');grid();

%Calculamos la potencia en tiempo (usando una integral discreta, como promedio de la energia,area bajo la curva):
potencia_tiempo = sum(abs(Xt).^2)/length(t);
mensaje = ['La potencia de la se�al mensaje es = ', num2str(potencia_tiempo),'W'] ;
disp(mensaje)



%%%%%%%%%%%%%% Transformada de fourier de X(t). %%%%%%%%%%%%%%%%%%%%%
N = length(Xt);
%Calculamos la transformada de fourier corrida y reescalada.
AbsXf = abs(fftshift(fft(Xt)))/N;
%Generamos el eje X de la grafica.
f = linspace(-Fs/2,Fs/2,length(AbsXf));
%Graficamos en funcion de la frecuencia
figure(2); plot(f,AbsXf); axis([-100 100 0 1]); title('2a2) Se�al mensaje en frecuencia, antes de modular'); xlabel('f'); ylabel('X(f)');grid();


%Calculamos el ancho de banda. Usando un detector de minimos.
%Declaramos variables auxiliares. Valles guardara la cantidad de minimos
%que hemos encontrado. BW guarda el valor en el que se encuentra el tercer
%minimo
valles = 0;
BW = 0;

%Recorremos la funcion de la magnitud del espectro de la se�al mensajem
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






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Modulando en SSB. %%%%%%%%%%%%5%%%%%%%%%%%%%%%%%%%%%5

% 2.d)Desfasando 90 grados con la transformada de Hilbert.

%Transformada de Hilbert
XHilbert = (hilbert(Xt) - Xt)/i;
%Transformada de Hilbert (Espectro)
AbsXHilbert = abs(fftshift(fft(XHilbert)))/length(XHilbert);
%Grficamos
figure(3); plot(t,real(XHilbert)); axis([-0.25 0.25 -2 2]); title('2d1) Se�al mensaje en tiempo, desfasado 90 grados con la transformada de Hilbert'); xlabel('t'); ylabel('XHilbert(t)');grid();
figure(4); plot(f,AbsXHilbert); axis([-100 100 0 1]); title('2d2) Se�al mensaje en frecuencia, desfasado 90 grados con la transformada de Hilbert'); xlabel('f'); ylabel('XHilbert(f)');grid();




%2.e) Multiplicando la senal de entrada por el oscilador de 500Hz
%Componente en Fase
XssbFase = (5/2).*Xt.*cos(500*2*pi.*t);

%Componente en Fase (Espectro)
AbsXssbFase = abs(fftshift(fft(XssbFase)))/length(XssbFase);
%Graficamos
figure(5); plot(t,XssbFase); axis([-0.03 0.03 -3.5 3.5]); title('2e1) Se�al mensaje en tiempo, multiplicada por el oscilador'); xlabel('t'); ylabel('XssbFase(t)');grid();
figure(6); plot(f,AbsXssbFase); axis([-700 700 0 1.1]); title('2e2) Se�al mensaje en frecuencia, multiplicada por el oscilador'); xlabel('f'); ylabel('XssbFase(f)');grid();




%2.f) Multiplicando la senal de entrada desfasado 90 grados por el oscilador de 500Hz
%Componente en Cuadratura
XssbQuad = (5/2).*XHilbert.*sin(500*2*pi*t);

%Componente en Cuadratura (Espectro)
AbsXssbQuad = abs(fftshift(fft(XssbQuad)))/length(XssbQuad);
%Graficamos
figure(7); plot(t,real(XssbQuad)); axis([-0.03 0.03 -3.5 3.5]); title('2f1) Se�al mensaje en tiempo,desfasada y multiplicada por el oscilador'); xlabel('t'); ylabel('XssbQuad(t)');grid();
figure(8); plot(f,AbsXssbQuad); axis([-700 700 0 1.1]); title('2f2) Se�al mensaje en frecuencia, desfasada y multiplicada por el oscilador'); xlabel('f'); ylabel('XssbQuad(f)');grid();



%2.g) Senal modulada en SSB, suma de su componente en fase y componente en
%cuadratura
%La senal modulada en en SSB es:
Xssb = XssbFase - XssbQuad;

%Componente en Cuadratura (Espectro)
AbsXssb = abs(fftshift(fft(Xssb)))/length(Xssb);
%Graficamos
figure(9); plot(t,real(Xssb)); axis([-0.03 0.03 -5 5]); title('2g1) Se�al mensaje en tiempo, Modulada'); xlabel('t'); ylabel('Xssb(t)');grid();
figure(10); plot(f,AbsXssb); axis([-700 700 0 2.2]); title('2g2) Se�al mensaje en frecuencia, Modulada'); xlabel('f'); ylabel('Xssb(f)');grid();



%2.h) Calculando el ancho de Banda de la se�al modulada
%Calculamos el ancho de banda. Usando un detector de maximos.
%Declaramos variables auxiliares. Valles guardara la cantidad de maximos
%que hemos encontrado. BW guarda el valor en el que se encuentra el tercer
%maximo
picos = 0;
BW2 = 0;

%Recorremos la funcion de la magnitud del espectro de la se�al modulada
%desde la mitad hacia arriba
for a = ((round(length(AbsXssb)/2))+1):length(AbsXssb)

    %Si el punto en el que estamos es mayor que los puntos alrededor de el.
    %Es un maximo
    if (AbsXssb(a-1) < AbsXssb(a)) && (AbsXssb(a+1) < AbsXssb(a))
        %Registramos que pasamos por un pico
        picos = picos + 1;
    end

    %Cuando pasemos por 3 picos, registramos en que punto de la base de
    %frecuencia se encuentra el tercer pico.
    if picos == 3
        BW2 = f(a);
        break
    end

end
%Le sumamos al tercer pico la frecuencia base de la se�al mensaje. Imprimimos el resultado.
mensaje = ['El ancho de banda luego de modular es = ', num2str(BW2 + frecuencia_mensaje ),'Hz'] ;
disp(mensaje)



%2.i) Calculando la Potencia de la se�al modulada
%Calculamos la potencia en tiempo (usando una integral discreta, como promedio de la energia,area bajo la curva):
potencia_tiempo = sum(abs(Xssb).^2)/length(Xssb);
mensaje = ['La potencia de la se�al modulada es = ', num2str(potencia_tiempo),'W'] ;
disp(mensaje)





