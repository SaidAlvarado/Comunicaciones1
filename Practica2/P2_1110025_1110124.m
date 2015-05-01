%cerramos todas las ventanas existentes hasta el momento
close all
%% %%%%%%%%%%%%%%%% Laboratorio 2 Modulacion FM %%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Inicializacion de las variables de laboratorio
Fs=110250;      %Frecuencia de muestreo
N=825000;       %Numero de puntos de cada senal
Am=5;           %Amplitud de la primera senal
fMensaje=10000  %Frecuencia del tono a generar


%% %%%%%%%%%%%%%%%%%%%%% Prelaboratorio %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 1) Generacion del tono

%generamos la base de tiempo
t=-3.7415:1/Fs: 3.7415 -1/110250;
%definimos el tono
y=Am*cos(2*pi*fMensaje*t);



%% %%%%%%%%%%%%%%%%%%%% Trabajo de laboratorio %%%%%%%%%%%%%%%%%%%%%%%

%% 2) Graficamos el tono en dominio temporal.
%graficamos el tono
figure; plot(t,y); axis([-0.001 0.001 -10 10]) ; title('Tono en el dominio temporal'); xlabel('t'); ylabel('x(t)');grid();

%% 3) Graficamos el espectro.
%Calculamos el espectro del tono
xTono=abs(fftshift(fft(y))/length(y));
%Creamos la base de frecuencia
f=linspace(-Fs/2,Fs/2,length(xTono));
%graficamos la frecuencia
figure; plot(f,xTono);axis([-10000 10000 -0 3 ]); title('Tono en el dominio frecuencial'); xlabel('w'); ylabel('x(f)');grid();



%% 4) Modulacion FM del tono
%Definimos las propiedades de modulacion
fc=10*fMensaje;
beta=1;
fq=beta*fMensaje/(Am);


%% 4.b) Graficas de espectro para Beta=1
%Para Beta=1 Fm=1000  Am1=1
%difinimos los parametros de la grafica a modular
beta=1;
Am1=5;
fq1=beta*fMensaje/(Am1);
%creamos el nuevo tono
ym1=Am1*cos(2*pi*fMensaje*t);
%aplicamos la modulacion
xb1g1=fmmod(ym1,fc,Fs,fq1);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
%Calculamos el espectro y graficamos
xb1g1f=abs(fftshift(fft(xb1g1))/length(xb1g1));
figure ; plot(f,xb1g1f); title('Tono con Am=1 B=1'); xlabel('w'); ylabel('x(f)');grid();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Se repite el mismo procedimiento para las demas graficas            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Para beta=1 Fm=1000 Am2=10
Am2=10;
fq2=beta*fMensaje/(Am2);
ym2=Am2*cos(2*pi*fMensaje*t);
xb1g2=fmmod(ym2,fc,Fs,fq2);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g2f=abs(fftshift(fft(xb1g2))/length(xb1g2));
figure;plot(f,xb1g2f); title('Tono con Am=10 B=1'); xlabel('w'); ylabel('x(f)');grid();


% Para beta=1 Fm=1000 Am=15
Am3=15;
fq=beta*fMensaje/(Am3);
ym3=Am3*cos(2*pi*fMensaje*t);
xb1g3=fmmod(ym3,fc,Fs,fq);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g3f=abs(fftshift(fft(xb1g3))/length(xb1g3));
figure;plot(f,xb1g3f); title('Tono con Am=15  B=1'); xlabel('w'); ylabel('x(f)');grid();




%% 4.c) Graficas de espectro para Beta=2
beta=2;

%Para Beta=2 Fm=1000  Am1=5
Am1=5;
fq1=beta*fMensaje/(Am1);
disp(fq)
ym1=Am1*cos(2*pi*fMensaje*t);
xb1g1=fmmod(ym1,fc,Fs,fq1);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g1f=abs(fftshift(fft(xb1g1))/length(xb1g1));
figure; plot(f,xb1g1f);  title('Tono con Am=5  B=2'); xlabel('w'); ylabel('x(f)');grid();

% Para beta=2 Fm=1000 Am2=10
Am2=10;
fq2=beta*fMensaje/(Am2);
ym2=Am2*cos(2*pi*fMensaje*t);
xb1g2=fmmod(ym2,fc,Fs,fq2);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g2f=abs(fftshift(fft(xb1g2))/length(xb1g2));
figure;plot(f,xb1g2f);  title('Tono con Am=10  B=2'); xlabel('w'); ylabel('x(f)');grid();


% Para beta=2 Fm=1000 Am=20
Am3=15;
fq=beta*fMensaje/(Am3);
ym3=Am3*cos(2*pi*fMensaje*t);
xb1g3=fmmod(ym3,fc,Fs,fq);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g3f=abs(fftshift(fft(xb1g3))/length(xb1g3));
figure;plot(f,xb1g3f);  title('Tono con Am=15  B=2'); xlabel('w'); ylabel('x(f)');grid();


%% 4.d) Graficas de espectro para Beta=5
beta=5;
% Para Beta=5 Fm=1000  Am1=5
Am1=5;
fq1=beta*fMensaje/(Am1);
disp(fq)
ym1=Am1*cos(2*pi*fMensaje*t);
xb1g1=fmmod(ym1,fc,Fs,fq1);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g1f=abs(fftshift(fft(xb1g1))/length(xb1g1));
figure; plot(f,xb1g1f);   title('Tono con Am=5  B=5'); xlabel('w'); ylabel('x(f)');grid();

% Para beta=5 Fm=1000 Am2=10
Am2=10;
fq2=beta*fMensaje/(Am2);
ym2=Am2*cos(2*pi*fMensaje*t);
xb1g2=fmmod(ym2,fc,Fs,fq2);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g2f=abs(fftshift(fft(xb1g2))/length(xb1g2));
figure;plot(f,xb1g2f); title('Tono con Am=10  B=5'); xlabel('w'); ylabel('x(f)');grid();

% Para beta=5 Fm=1000 Am=15
Am3=15;
fq=beta*fMensaje/(Am3);
ym3=Am3*cos(2*pi*fMensaje*t);
xb1g3=fmmod(ym3,fc,Fs,fq);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g3f=abs(fftshift(fft(xb1g3))/length(xb1g3));
figure;plot(f,xb1g3f);  title('Tono con Am=15  B=5'); xlabel('w'); ylabel('x(f)');grid();



%% 5) Graficas de Amplitud constante y se cambiam la frecuencia para varios betas.

%% 5.a)  Fijamos la amplitud en 5
Am=5;

%% 5.b) Graficas de espectro para Beta=1
beta=1;
% Para Beta=1 Fm=10
fMensaje1 = 10;
fq1=beta*fMensaje1/(Am);
disp(fq)
ym1=Am*cos(2*pi*fMensaje1*t);
xb1g1=fmmod(ym1,fc,Fs,fq1);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g1f=abs(fftshift(fft(xb1g1))/length(xb1g1));
figure ; plot(f,xb1g1f); title('Tono con Am=5  B=1 fm=10'); xlabel('w'); ylabel('x(f)');grid();

% Para beta=1 Fm=100
fMensaje2 = 100;
fq2=beta*fMensaje2/(Am);
ym2=Am*cos(2*pi*fMensaje2*t);
xb1g2=fmmod(ym2,fc,Fs,fq2);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g2f=abs(fftshift(fft(xb1g2))/length(xb1g2));
figure;plot(f,xb1g2f); title('Tono con Am=5  B=1 fm=100'); xlabel('w'); ylabel('x(f)');grid();
disp(fq2)

% Para beta=1 Fm=1000
fMensaje3 = 1000;
fq=beta*fMensaje3/(Am);
ym3=Am*cos(2*pi*fMensaje3*t);
xb1g3=fmmod(ym3,fc,Fs,fq);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g3f=abs(fftshift(fft(xb1g3))/length(xb1g3));
figure;plot(f,xb1g3f); title('Tono con Am=5  B=1 fm=1000'); xlabel('w'); ylabel('x(f)');grid();


%% 5.e) Graficas de espectro para Beta = 2
beta=2;
% Para Beta=2 Fm=10
fMensaje1 = 10;
fq1=beta*fMensaje1/(Am);
ym1=Am*cos(2*pi*fMensaje1*t);
xb1g1=fmmod(ym1,fc,Fs,fq1);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g1f=abs(fftshift(fft(xb1g1))/length(xb1g1));
figure ; plot(f,xb1g1f); title('Tono con Am=5  B=2 fm=10'); xlabel('w'); ylabel('x(f)');grid();

% Para beta=2 Fm=100
fMensaje2 = 100;
fq2=beta*fMensaje2/(Am);
ym2=Am*cos(2*pi*fMensaje2*t);
xb1g2=fmmod(ym2,fc,Fs,fq2);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g2f=abs(fftshift(fft(xb1g2))/length(xb1g2));
figure; plot(f,xb1g2f); title('Tono con Am=5  B=2 fm=100'); xlabel('w'); ylabel('x(f)');grid();


% Para beta=2 Fm=1000
fMensaje3 = 1000;
fq=beta*fMensaje3/(Am);
ym3=Am*cos(2*pi*fMensaje3*t);
xb1g3=fmmod(ym3,fc,Fs,fq);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g3f=abs(fftshift(fft(xb1g3))/length(xb1g3));
figure;plot(f,xb1g3f); title('Tono con Am=5  B=2 fm=1000'); xlabel('w'); ylabel('x(f)');grid();


%% 5.f) Graficas de espectro para Beta = 5
beta=5;
% Para Beta=5 Fm=10
fMensaje1 = 10;
fq1=beta*fMensaje1/(Am);
ym1=Am*cos(2*pi*fMensaje1*t);
xb1g1=fmmod(ym1,fc,Fs,fq1);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g1f=abs(fftshift(fft(xb1g1))/length(xb1g1));
figure ; plot(f,xb1g1f); title('Tono con Am=5  B=5 fm=10'); xlabel('w'); ylabel('x(f)');grid();

% Para beta=5 Fm=100
fMensaje2 = 100;
fq2=beta*fMensaje2/(Am);
ym2=Am*cos(2*pi*fMensaje2*t);
xb1g2=fmmod(ym2,fc,Fs,fq2);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g2f=abs(fftshift(fft(xb1g2))/length(xb1g2));
figure;plot(f,xb1g2f); title('Tono con Am=5  B=5 fm=100'); xlabel('w'); ylabel('x(f)');grid();


% Para beta=5 Fm=1000
fMensaje3 = 1000;
fq=beta*fMensaje3/(Am);
ym3=Am*cos(2*pi*fMensaje3*t);
xb1g3=fmmod(ym3,fc,Fs,fq);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g3f=abs(fftshift(fft(xb1g3))/length(xb1g3));
figure;plot(f,xb1g3f); title('Tono con Am=5  B=5 fm=1000'); xlabel('w'); ylabel('x(f)');grid();




%% 7) Modulacion de senales genericas, variando el coeficiente de desviacion
% Importamos el mensaje desde su archivo, usando una funcion personalizada (que puede encontrar en un archivo adjunto)
 senal2=mensaje('mensaje1');
 Ws2=4550
 fc1=527 %se define la frecuencia de la portadora

%% 7.b)  Se grafica el espectro de la senal variando los coeficientes de desviacion.

 % Para Delta=1
 Delta=1;
 %se calcula la frecuencia de desviacion apartir del delta
 fq1=Ws2*Delta;
 % se procede a realizar la modulacion FM
 xd1=fmmod(senal2,fc1,Fs,fq1); % fq es la frecuencia de desviacion, senal es el mensaje, fc es la frecuencia de la portadora
 %Se calcula y grafica el espectro.
 xd1f=abs(fftshift(fft(xd1))/length(xd1));
 figure;plot(f,xd1f); title('Señal 1 con Delta=1'); xlabel('w'); ylabel('xs(f)');grid();


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Se repite el mismo procedimiento para las demas graficas            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 % Para Delta=5
 Delta=5;
 fq1=Ws2*Delta;
 xd5=fmmod(senal2,fc1,Fs,fq1);
 xd5f=abs(fftshift(fft(xd5))/length(xd5));
 figure;plot(f,xd5f); title('Señal 1 con Delta=5'); xlabel('w'); ylabel('xs(f)');grid();

 % Para Delta=10
 Delta=10;
 fq1=Ws2*Delta;
 xd10=fmmod(senal2,fc1,Fs,fq1);
 xd10f=abs(fftshift(fft(xd10))/length(xd10));
 figure;plot(f,xd10f); title('Señal 1 con Delta=10'); xlabel('w'); ylabel('xs(f)');grid();



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         El resto de la practica se encuentra en el archivo "receptor.m"        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







