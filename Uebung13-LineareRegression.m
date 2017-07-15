% ---------- Uebung 13 -----------
% s0556127 Alexander Tiedmann
% s0556469 Laila Westphal
% am 11/07/2017
% ---------- Vorbereitung ----------
clc
%Alle Variablen loeschen
clear;
%output paging ausschalten, so, 
%dass das sktipt ohne anhalten durchlaeuft
more off

%---------- Funktionen ----------
%Lineare Regression
function [a,b]=linReg(xm,ym)
  [m,n]=size(xm);
  a=[sum(xm.^2) sum(xm);sum(xm) n];
  D= det(a);
  a1=[sum(xm.*ym) sum(ym);sum(xm) n ];
  D1=det(a1);
  a2=[sum(xm.^2) sum(xm); sum(xm.*ym) sum(ym)];
  D2=det(a2);
  a=D1/D;
  b=D2/D;
end

%quadratische Regression
function [a,b,c]=quadReg(xm,ym)
[m,n]=size(xm);
  d=[
  sum(xm.^4) sum(xm.^3) sum(xm.^2);
  sum(xm.^3) sum(xm.^2) sum(xm);
  sum(xm.^2) sum(xm) n];
D=det(d);

d1=[
   sum(xm.^2.*ym) sum(xm.^3) sum(xm.^2);
   sum(xm.*ym) sum(xm.^2) sum(xm);
   sum(ym) sum(xm) n];
D1=det(d1);

d2=[
   sum(xm.^4) sum(xm.^2.*ym) sum(xm.^2)
   sum( xm.^3) sum(xm.*ym) sum(xm)
   sum(xm.^2) sum(ym) n];
D2=det(d2);

d3=[
  sum(xm.^4) sum(xm.^3) sum(xm.^2.*ym);
  sum(xm.^3) sum(xm.^2) sum(xm.*ym);
  sum(xm.^2) sum(xm) sum(ym)];
D3=det(d3);

a=D1/D;
b=D2/D;
c=D3/D;
end

function [a,b]=regression(xm,ym)
  u=xm;
  v=log(ym);
  [c,d]=linReg(u,v);
  b=c;
  a=exp(d);
end

%--------Aufgabe1--------------------------
fprintf("-----Aufgabe 1----- \n")
ym=[8.6 11.5 12.4 15.6 15.1 17.7 18.9 18.6 21.3 24.3];
xm=[10.6 14.0 18.1 23.2 25.0 26.4 30.5 32.5 36.6 40.1];
[a,b]=linReg(xm,ym)

%--------Aufgabe2--------------------------
fprintf("-----Aufgabe 2----- \n")
xm=[1.3 2.2 2.9 3.1 4.5 5.7 7.1 8.0 8.7 8.9 9.3 9.9 ];
ym=[1.3 1.0 0.85 0.80 0.33 0 -0.4 -0.7 -0.9 -1.0 -1.1 -1.2];
[a,b]=linReg(xm,ym)

%--------Aufgabe3--------------------------
fprintf("-----Aufgabe 3----- \n")
xm=[1 2 3 3.5 4.5 5.5 6 7 8 8.5 9.5 10];
ym=[11 7.3 4.8 4.1 1.0 0 0.6 2 3.7 4.2 5.6 8];
[a,b,c]=quadReg(xm,ym)

%--------Aufgabe4--------------------------
fprintf("-----Aufgabe 4----- \n")
ym=[2.63 1.18 1.16 1.54 2.65 5.41 7.67];
xm=[0.04 0.32 0.51 0.73 1.03 1.42 1.60];
[a,b,c]=quadReg(xm,ym)

%--------Aufgabe5--------------------------
fprintf("-----Aufgabe 5----- \n")
xm=[1 2 3 4 5];
ym=[1.8395 0.6765 0.2490 0.0915 0.0335];
[a,b]=regression(xm,ym)