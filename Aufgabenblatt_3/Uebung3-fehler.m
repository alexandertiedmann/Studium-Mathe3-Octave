% am 05.05.2017

%---------------Vorbereitung---------------
%Befehlsfenster saubern
clc;
%Alle Variablen loeschen
clear;
%Auf long umstellen
format long

%---------------Funktionen---------------
%relativer Fehler
function r=relFailure(A,b)
  links=(cond(A,"fro"))/(1-((norm(delta(A),"fro"))*norm(inv(A),"fro")));
  rechts=(norm(delta(A),"fro")/norm(A,"fro"))+((norm(delta(b),"fro"))/(norm(b,"fro")));
  r=links*rechts;
end

%absoluter Fehler
function [a]=absFailure(f,x)
  a=f*x;
end 

%berechnet deltaA mit 5*10^(-6)
function [d]=delta(A)
  d=A.*(5*10^(-6));
end

%Fehler als Intervall
function [i]=intervall(x,fail)
  i=[x.-fail,x.+fail]; 
end

%A\b
function [r]=division(A,b)
  r=A\b;
end


%---------------Uebung 3---------------
%a)
A=[2 3 -1; 2 1 -1;-4 2 1];
b=[0;2;-9];
divA=division(A,b);
relA=relFailure(A,b);
absA=absFailure(relA,divA)
intA=intervall(divA,absA)

%b)
A=[1 1 0 3;2 1 -1 1;3 -1 -1 2;-1 2 3 -1];
b=[4;1;-3;4];
divB=division(A,b);
relB=relFailure(A,b);
absB=absFailure(relB,divB)
intB=intervall(divB,absB)

%c)
A=[0 3 -5 1;-1 -3 0 -1;-2 1 2 2;-3 4 2 2];
b=[0;-5;2;8];
divC=division(A,b);
relC=relFailure(A,b);
absC=absFailure(relC,divC)
intC=intervall(divC,absC)

%d)
A=[5  -3 0 2;2 6 -3 0;-1 2 4 -1;-2 -3 2 7];
b=[13;16;-11;10];
divD=division(A,b);
relD=relFailure(A,b);
absD=absFailure(relD,divD)
intD=intervall(divD,absD)