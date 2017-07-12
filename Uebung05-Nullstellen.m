% ---------- Uebung 5 -----------
% s0556469 Laila Westphal
% s0556127 Alexander Tiedmann
% am 19.05.2017

%---------------Vorbereitung---------------
%Befehlsfenster saeubern
clc;
%Alle Variablen loeschen
clear;

%a)
 function y=a(x)
  y=cos(x)-x;
 end
  xA=-5:0.1:5;%Intervalle (von:Schrittweite:Bis)
  figure(1),plot(xA,a(xA),'r'),grid;
  a1=fzero(@a,1)
 
%b)
 function y=b(x)
  y=sin(x)+2.*x.^(1/2)-1;
 end
  xB=0:0.1:10;
  figure(2),plot(xB,b(xB),'b'),grid;
  b1=fzero(@b,1)
 
%c)
function y=c(x)
  y=x.*e.^(x)-1;
end
  xC=-1:0.1:1;
  figure(3),plot(xC,c(xC),'m'),grid;
  c1=fzero(@c,1)
 
%d)
 function y=d(x)
  y=1+cos(x).*cosh(x);
 end
  xD=-10:0.1:10;
  xD2=-5:0.01:5;
  %unendlich viele Nullstellen
  figure(4),plot(xD,d(xD),'g'),grid;
  figure(5),plot(xD2,d(xD2),'k'),grid;
  %Beipiel-Nullstellen
  d1=fzero(@d,-10)
  d2=fzero(@d,-8)
  d3=fzero(@d,-6)
  d4=fzero(@d,-3)
  d5=fzero(@d,1)
  d6=fzero(@d,3)
  %Differenzen der Nullstellen um regelm‰ﬂigkeit nachzuweisen
  differzen21=d2-d1
  differenz32=d3-d2
  differenz43=d4-d3
  differenz54=d5-d4
  differenz65=d6-d5
  %die Differenz betr‰gt ca. Pi