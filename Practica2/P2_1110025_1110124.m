close all
%%%%%%%%%%%%%%%%%% Laboratorio 2 Modulacion FM %%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Inicializacion de las variables de laboratorio 
Fs=110250;
N=825000;
Am=5;
fMensaje=1000



%% Generacion del tono 
t=-3.7415:1/Fs: 3.7415 -1/110250;
y=Am*cos(2*pi*fMensaje*t);
figure; plot(t,y); axis([-0.001 0.001 -10 10]) ; title('Tono en el dominio temporal'); xlabel('t'); ylabel('x(t)');grid();

xTono=abs(fftshift(fft(y))/length(y));
f=linspace(-Fs/2,Fs/2,length(xTono));
figure; plot(f,xTono);axis([-10000 10000 -0 3 ]); title('Tono en el dominio frecuencial'); xlabel('w'); ylabel('x(f)');grid();

%% Modulacion FM del tono 

fc=10*fMensaje;
beta=1;
fq=beta*fMensaje/(Am);

%% Para Beta=1 Fm=1000  Am1=1
beta=1;
Am1=5;
fq1=beta*fMensaje/(Am1);

ym1=Am1*cos(2*pi*fMensaje*t);

xb1g1=fmmod(ym1,fc,Fs,fq1);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g1f=abs(fftshift(fft(xb1g1))/length(xb1g1));
figure ; plot(f,xb1g1f); title('Tono con Am=1 B=1'); xlabel('w'); ylabel('x(f)');grid();

% Para beta=1 Fm=1000 Am2=20
Am2=10;
fq2=beta*fMensaje/(Am2);
ym2=Am2*cos(2*pi*fMensaje*t);
xb1g2=fmmod(ym2,fc,Fs,fq2);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g2f=abs(fftshift(fft(xb1g2))/length(xb1g2));
figure;plot(f,xb1g2f); title('Tono con Am=10 B=1'); xlabel('w'); ylabel('x(f)');grid();

 
 % Para beta=1 Fm=1000 Am=5

Am3=15;
fq=beta*fMensaje/(Am3);
ym3=Am3*cos(2*pi*fMensaje*t);
xb1g3=fmmod(ym3,fc,Fs,fq);  % fq es la frecuencia de desviacion, y es el tono, fc es la frecuencia de la portadora
xb1g3f=abs(fftshift(fft(xb1g3))/length(xb1g3));
figure;plot(f,xb1g3f); title('Tono con Am=15  B=1'); xlabel('w'); ylabel('x(f)');grid();

 
%% Para Beta=2 
% Para Beta=2 Fm=1000  Am1=5
beta=2;
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


%% Para Beta=5
% Para Beta=5 Fm=1000  Am1=5
beta=5;
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



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
%Mantenemos Amplitud constante y cambiamos la frecuencia para varios betas.


Am=5;

%% Para Beta=1 Fm=10 
beta=1;
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

%% Para Beta=2 Fm=10 
beta=2;
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

%% Para Beta=5 Fm=10 
beta=5;
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


 %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Modulacion para señales genericas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
 senal2=mensaje('mensaje1');
 Ws2=4550
 fc1=527
 
 % Para Delta=1 
 
 Delta=1;
 fq1=Ws2*Delta;
 xd1=fmmod(senal2,fc1,Fs,fq1);
 xd1f=abs(fftshift(fft(xd1))/length(xd1));
 figure;plot(f,xd1f); title('Señal 1 con Delta=1'); xlabel('w'); ylabel('xs(f)');grid();
 
 
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
 
 
 
 
 
 

