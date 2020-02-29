%% Practica 2: Se�ales en tiempo discreto.
%
% Integrantes:
%
% * Betanzos Ferrando Melvin Emiliano
%
% * Garc�a Becerril Luis �ngel Ian
%
% * Rosales Perez Paola Monserrat
%
% Grupo: 2MV1
%
%%Objetivos:
% Manipulaci�n b�sica de MATLAB
% Gr�ficas de se�ales reales y complejas discretas
% Transformaci�n de se�ales discretas (escalamientos y traslaciones
%% Introduccion 
% El escalamiento horizontal es una operaci�n que se le aplica a una se�al base para generar una se�al nueva. Analiticamente un escalamiento horizontal tiene la forma:
%%
% g[n]=hEb{f[n]}=f[bn].
%%
% El escalamiento horizontal nos puede arrojar dos resulados, una compresi�n o una expansi�n de la se�al.
% Visualmente se podria suponer que cuando vemos una expresi�n de este tipo f(n)=2n damos por hecho que la se�al se duplicar�, sin embargo ocurre todo lo contrario.
% Si tenemos una b>1 tendremos una compresi�n y esto implica que podamos tener una perdida de "datos", esta perdida de datos dependera del valor de b, ya que solo se conservaran las b-�simas muestras b+N, es decir solo multiplos de b.
%% 
% A continuaci�n se muestra un ejemplo de escalonamiento cuando b>1, en
% este caso se tiene una funci�n f(n)=n y con base en esta se busca generar
% una se�al g(n)=f(2n).
%%
f=@(n) n.*(n>=0);
figure
n=-10:10;
stem(n,f(n));
grid on
ylabel('f(n)')
xlabel('n')
title('Funci�n original f(n)=n')
g=@(n) (2.*n).*(2.*n>=0);
figure
n=-10:10;
stem(n,g(n))
grid on
ylabel('g(n)')
xlabel('n')
title('Funci�n escalonada g(n)=2n')
%%
% Podemos ver como se pierde informaci�n de los valores n={3,5,7,..}.
%% 
% Cuando 0<b<1 tenemos una expansi�n de la se�al. Lo que sucede en estos casos es que se generan huecos en la se�al, es decir, en vez de perder informaci�n nos faltaria informaci�n, esto ocurre debido a que si recordamos, las se�ales discretas por norma se evaluan en valores enteros.
% Para ejemplificar este tipo de escalonamiento usaremos una funci�n h(n)=1
% cuando se cumpla la siguiente condici�n: -3<=n<=1 y se busca hacer un
% escalamiento y(n)=h(0.5n).
%%
h=@(n) n.*(n<=1);
figure
n=-5:5;
stem(n,h(n));
grid on
ylabel('h(n)')
xlabel('n')
title('Funci�n original h(n)=n')
y=@(n) ((0.5).*n).*(n<=2);
figure
n=-5:5;
stem(n,y(n));
grid on
ylabel('y(n)')
xlabel('n')
title('Funci�n escalonada y(n)=n')
%%
% Podemos resaltar la informaci�n m�s importante en los siguientes puntos.
% *Se pierden datos cuando se comprime, s�lo podemos
% ver m�ltiplos del valor de compresi�n (siempre entero).
% * Cuando expandimos, tenemos la se�al completa.
%
%% PROBLEMA 1
%% PARTE 1
% Para x[n] grafique las siguientes se�ales:
%
x=@(t) ((t).*(t>=0 ))
h=@(t) ((0).*(t>3))
y=@(t) (((-t)+6).*(t>=3))
t= (0:1:6);
hold off
stem (t,x(t));
hold on
stem (t,y(t));
hold off
%% PARTE 2
%
x=@(t) ((t).*(t>=0 ))
h=@(t) ((0).*(t>3))
y=@(t) (((-t)+6).*(t>=3))
t= (0:1:6);
hold off
stem (t,x(-t));
hold on
stem (t,y(-t));
hold off
%% PARTE 3
x=@(t) ((t).*(t>=0 ))
h=@(t) ((0).*(t>3))
y=@(t) (((-t)+6).*(t>=3))
t= (0:1:6);
hold off
stem (t,x(t+6));
hold on
stem (t,y(t+6));
hold off
%% PARTE 4
x=@(t) ((t).*(t>=0 ))
h=@(t) ((0).*(t>3))
y=@(t) (((-t)+6).*(t>=3))
t= (0:1:6);
hold off
stem (t,x(t-6));
hold on
stem (t,y(t-6));
hold off
%% PARTE 5 
x=@(t) ((t).*(t>=0 ))
h=@(t) ((0).*(t>3))
y=@(t) (((-t)+6).*(t>=3))
t= (0:1:6);
hold off
stem (t,x(3*t));
hold on
stem (t,y(3*t));
hold off
%% PARTE 6
x=@(t) ((t).*(t>=0 ))
h=@(t) ((0).*(t>3))
y=@(t) (((-t)+6).*(t>=3))
t= (0:1:6);
hold off
stem (t,x(t/3));
hold on
stem (t,y(t/3));
hold off
%% PARTE 7
x=@(t) ((t).*(t>=0 ))
h=@(t) ((0).*(t>3))
y=@(t) (((-t)+6).*(t>=3))
t= (0:1:6);
hold off
stem (t,x(3-t));
hold on
stem (t,y(3-t));
hold off
%% Problema 2 
% Cree una funci�n que gr�fique funciones de f:Z-R.
% Resuelva el problema 3.3.7 de Lathi:
% Encuentre y grafique los componentes pares e impares de:
% u(n)
% nu(n)
% sin((pi*n)/4)
% cos ((pi*n)/4)
%% Parte 1
u=@(t) (t>=0);
x2=@(t) 0.5*(u(t)+u(-t));
x3=@(t) 0.5*(u(t)-u(-t));
figure
stem(t,x2(t));
grid on
title('Parte Par')
figure
stem(t,u(t));
grid on
title('Parte Impar')
%% Parte 2
tu1=@(t) (t>=0);
x2=@(t) 0.5*(tu1(t)+tu1(-t));
x3=@(t) 0.5*(u(t)-u(-t));
figure
stem(t,tu1(t));
grid on
title('Parte Par')
figure
stem(t,tu1(t));
grid on
title('Parte Impar')
%%Parte 3
x4=@(t) sin((pi*t)/4);
x2=@(t) 0.5*(x4(t)+x4(-t));
x3=@(t) 0.5*(x4(t)-x4(-t));
figure
stem(t,x2(t));
grid on
title('Parte Par')
figure
stem(t,x3(t));
grid on
title('Parte Impar')
%%Parte 4
x5=@(t) cos((pi*t)/4);
x2=@(t) 0.5*(x5(t)+x5(-t));
x3=@(t) 0.5*(x5(t)-x5(-t));
figure
stem(t,x2(t));
grid on
title('Parte Par')
figure
stem(t,x3(t));
grid on
title('Parte Impar')