% ---------- Uebung 11 -----------
% s0556469 Laila Westphal
% s0556127 Alexander Tiedmann
% am 14/07/2017
% ---------- Vorbereitung ----------
clc
%Alle Variablen loeschen
clear;
%output paging ausschalten, so, 
%dass das sktipt ohne anhalten durchlaeuft
more off
%----------- Hilffunktion ----------
function y = integrand(x)
  y = x.^2.*exp(-x.^2) ;
end
%--------Aufgabe1--------------------------
fprintf("-----Aufgabe 1----- \n")
fprintf("Numerische Berechnung der 1. und 2. Ableitung der Funktionen a) bis e) im jeweiligen Intervall \n \n")

fprintf("Siehe Grafik. \n\n")
clear % Variablen loeschen

%a)
xa=-pi:0.01:pi; % Intervall
ya=cos(xa); %Funktion

%Erste Ableitung
dyxa=diff(ya)./diff(xa); % Numerische Differentiation
xra=xa;
xra(length(xa))=[]; % letzte Koordinate entfernen

%subplot(6,3,2),plot(xra,dyxa), title("f'(x)")

%Zweite Ableitung
dyxa2=diff(dyxa)./diff(xra);
xra2=xra;
xra2(length(xra))=[];

subplot(3,2,1), plot(xa,ya,'r',xra,dyxa,'g', xra2,dyxa2,'b'),
title('f(x) = cos(x), [-pi,pi]'), legend("f(x)","f'(x)","f''(x)")

%b)
xb=-10:0.01:10;
yb=xb./(1+xb.^2);

%Erste Ableitung
dyxb=diff(yb)./diff(xb);
xrb= xb;
xrb(length(xb))=[];

%Zweite Ableitung
dyxb2=diff(dyxb)./diff(xrb);
xrb2=xrb;
xrb2(length(xrb))=[];

subplot(3,2,2), plot(xb,yb,'r',xrb,dyxb,'g', xrb2,dyxb2,'b'),
title('g(x) = x/(1-x^2), [-10,10]'), legend("g(x)","g'(x)","g''(x)")

%c)
xc=-10:0.01:10;
yc=tanh(xc);

%Erste Ableitung
dyxc=diff(yc)./diff(xc);
xrc= xc;
xrc(length(xc))=[];

%Zweite Ableitung
dyxc2=diff(dyxc)./diff(xrc);
xrc2=xrc;
xrc2(length(xrc))=[];

subplot(3,2,3), plot(xc,yc,'r',xrc,dyxc,'g', xrc2,dyxc2,'b'),
title('h(x) = (e^x-e^-^x)/(e^x+e^-^x), [-10,10]'), legend("h(x)","h'(x)","h''(x)")

%d)
xd=-10:0.01:10;
yd=xd.*exp(xd);

%Erste Ableitung
dyxd=diff(yd)./diff(xd);
xrd= xd;
xrd(length(xd))=[];

%Zweite Ableitung
dyxd2=diff(dyxd)./diff(xrd);
xrd2=xrd;
xrd2(length(xrd))=[];

subplot(3,2,4), plot(xd,yd,'r',xrd,dyxd,'g', xrd2,dyxd2,'b'),
title('k(x) = x*e^x, [-10,10]'), legend("k(x)","k'(x)","k''(x)")

%e)
xe=0.1:0.01:5.1;
ye=xe.*log(xe);

%Erste Ableitung
dyxe=diff(ye)./diff(xe);
xre= xe;
xre(length(xe))=[];

%Zweite Ableitung
dyxe2=diff(dyxe)./diff(xre);
xre2=xre;
xre2(length(xre))=[];

subplot(3,2,5), plot(xe,ye,'r',xre,dyxe,'g', xre2,dyxe2,'b'),
title('l(x) = xln(x), [0.1,5.1]'), legend("l(x)","l'(x)","l''(x)")

% Monte Carlo Methide zur Berechnung bestimmter Integrale

function I = mcintgr(fun,a, b, mcloops)
  # Check input args
  if(nargin != 4 | nargout > 1)
    print_usage("mcintgr is called with 4 inputs and 1 output");
  endif
  #Check if user supplied function exists
  if!exist(fun)
    print_usage("mcintgr: Sure about the function name?");
  elseif(length(feval(fun,a))!= 1)
    print_usage("Function passed to mcintgr must be a scalar function");
  endif
  # Find maximum value of f
  x= linspace(a,b);
  y= feval(fun,x);
  # Check if f is positive
  if(min(y)<0)
    print_usage("mcintgr: the function must be positive in the interval");
  endif
  # Set max of m
  maxy = max(y);
  # Calculate the interval
  l = b-a;
  # Initialize the counters
  counter = 0;
  nloops = 0;
  # Main mc loop
  while(nloops<=mcloops)
    r1= a+l*rand;
    r2= maxy*rand;
    frl = feval(fun,r1);
    if(r2<frl)
      counter++;
    endif
    nloops++;
  endwhile
  # The integral
  I = counter/mcloops*maxy*l;
endfunction

%--------Aufgabe2--------------------------
clear
%eigene Implementierung der Simpson-Regel sowie numerische Berechnung der Funktionen
% Octave Simpson: I1 = quad(`integrand`,0,1) %adaptive Simpson-Quadratur (2. Grades)
% Monte-Carlo_Methode zur Berechnung bestimmter Intergale
fprintf("\n-----Aufgabe 2 und 3----- \n")
%Funktionen
function integrate(f,x1,x2)
  simpson=quadv(f,x1,x2)
  bereich=[x1:0.1:x2];
  xy=feval(f,bereich);
  trapezregel=trapz(xy)
  if(x1>=0 && x2>0)
    montecarlo=mcintgr(f,x1,x2,10000)
  else
    fprintf("print_usage: 'mcintgr: the function must be positive in the interval' \n")
  endif
end

%Aufgaben und Aufrufe:
printf("\n1) f(x) = sin(x), [0,pi] \n")
%f(x) = sin x, von 0 bis pi
function y=f1(x)
  y=sin(x);
end
integrate('f1',0,pi)

printf("\n2) g(x) = cos(x), [0,pi/2] \n")
%f(x) = cos x, von 0 bis pi/2
function y=f2(x)
  y=cos(x);
end
integrate('f2',0,pi/2)

printf("\n3) h(x) = sqrt(1+exp(0.5x^2)), [1,2.6] \n")
%f(x) = sqrt( 1 + exp(0.5x^2)), von 1 bis 2.6
function y=f3(x)
  y=sqrt(1+exp(0.5.*x.^2));
end
integrate('f3',1,2.6)

printf("\n4) i(x) = tan(x), [-1,0] \n")
%f(x) = tan x, von -1 bis 0
function y=f4(x)
  y=tan(x);
end
integrate('f4',-1,0)

printf("\n5) j(x) =(1-exp(-x))/x), [1,2] \n")
%f(x) = ( 1 – e^-x) / x, von 1 bis 2
function y=f5(x)
  y=1-e.^-x;
end
integrate('f5',1,2)

printf("\n6) k(x) = sqrt(1+2x^4), [1,4] \n")
%f(x) = sqrt( 1 + 2 x^4), von 1 bis 4
function y=f6(x)
  y=sqrt(1.+2.*x.^4);
end
integrate('f6',1,4)

printf("\n7) l(x) = x^3/(e^x-1), [0.5,1] \n")
%f(x) = x3 / ( e^x – 1 ), von 0.5 bis 1
function y=f7(x)
  y=(e.^x)-1;
end
integrate('f7',0.5,1)

printf("\n8) m(x) = e^x/x^2, [1,3] \n")
%f(x) = e^x / x^2, von 1 bis 3
function y=f8(x)
  y=(e.^x)/(x.^2);
end
integrate('f8',1,3)