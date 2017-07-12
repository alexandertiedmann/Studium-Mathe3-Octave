% ---------- Uebung 9 -----------
% s0556469 Laila Westphal
% s0556127 Alexander Tiedmann
% am 05.05.2017
%---------------Vorbereitung---------------
clc %Befehlsfenster saubern
%output paging ausschalten, so, 
%dass das sktipt ohne anhalten durchlaeuft
more off
%--------Aufgabe1--------------------------
clear %Variablen loeschen
fprintf("-----Aufgabe 1----- \n")
% hypergeometrische Verteilung
f0=hygepdf(0,20,5,5);
f0=f0*100
f1=hygepdf(1,20,5,5);
f1=f1*100
f2=hygepdf(2,20,5,5);
f2=f2*100
f3=hygepdf(3,20,5,5);
f3=f3*100
f4=hygepdf(4,20,5,5);
f4=f4*100
f5=hygepdf(5,20,5,5);
f5=f5*100
x=[0:5];
f=[ f0 f1 f2 f3 f4 f5 ];
figure(1),bar(x,f), 
title("Wahrscheinlichkeit fuer Ziehung von 0-5 fehlerhaften Geraeten"), 
xlabel("fehlerhafte Geraete"), ylabel("p")

%--------Aufgabe2--------------------------
clear %Variablen loeschen
fprintf("\n-----Aufgabe 2----- \n")
%Berechnet die Anazahl der Moeglichkeiten
function y = PosibilitiesToCounts(posibilities, c)
  counts = zeros(1, c);
  for i = posibilities
    i = i';
    s = sum(i);
    counts(s) = counts(s) + 1;  
  end
  y = counts; 
end
%Moeglichkeiten fuer einen Wuerfel
cube = [ 1:6 ];

% Berechnungen für 1 Würfel
n=1;
[A] = ndgrid(cube);
posibilities = [ A(:) ]';
counts = PosibilitiesToCounts(posibilities, 6*n);
p = counts ./ ( 6 ); %Wahrscheinlichkeit
X = [1:6];
EX = sum(X .* p); %Erwartungswert
varianz = sum(((X .- EX)  .^ 2) .* p); %Varianz
sigma = sqrt(varianz); %Standardabweichung
Zn = (X .- EX) ./ sigma;
figure(2),bar(Zn, p),grid
title("fuer n=1")

% Berechnungen für 2 Würfel
n=2;
[A, B] = ndgrid(cube, cube);
posibilities = [ A(:) B(:) ]';
counts = PosibilitiesToCounts(posibilities, 6*n);
p = counts ./ ( 6 ^ 2 ); %Wahrscheinlichkeit
X = [1:12];
EX = sum(X .* p); % Erwartungswert
varianz = sum(((X .- EX)  .^ 2) .* p); %Varianz
sigma = sqrt(varianz); %Standardabweichung
Zn = (X .- EX) ./ sigma;
figure(3),bar(Zn, p),grid
title("fuer n=2")

% Berechnungen für 3 Würfel
n=3;
[A, B, C] = ndgrid(cube, cube, cube);
posibilities = [ A(:) B(:) C(:) ]';
counts = PosibilitiesToCounts(posibilities, 6*n);
p = counts ./ ( 6 ^ 3 ); %Wahrscheinlichkeit
X = [1:18];
EX = sum(X .* p); %Erwartungswert
varianz = sum(((X .- EX)  .^ 2) .* p); %Varianz
sigma = sqrt(varianz); %Standardabweichung
Zn = (X .- EX) ./ sigma;
figure(4),bar(Zn, p),grid
title("fuer n=3")

% Berechnungen für 4 Würfel
n=4;
[A, B, C, D] = ndgrid(cube, cube, cube, cube);
posibilities = [ A(:) B(:) C(:) D(:) ]';
counts = PosibilitiesToCounts(posibilities, 6*n);
p = counts ./ ( 6 ^ 4 ); %Wahrscheinlichkeit
X = [1:24];
EX = sum(X .* p); % Erwartungswert
varianz = sum(((X .- EX)  .^ 2) .* p); %Varianz
sigma = sqrt(varianz); %Standardabweichung
Zn = (X .- EX) ./ sigma;
figure(5),bar(Zn, p),grid
title("fuer n=4")

% Berechnungen für 5 Würfel
n=5;
[A, B, C, D, E] = ndgrid(cube, cube, cube, cube, cube);
posibilities = [ A(:) B(:) C(:) D(:) E(:) ]';
counts = PosibilitiesToCounts(posibilities, 6*n);
p = counts ./ ( 6 ^ 5 ); %Wahrscheinlichkeit
X = [1:30];
EX = sum(X .* p); %Erwartungswert
varianz = sum(((X .- EX)  .^ 2) .* p); %Varianz
sigma = sqrt(varianz); %Standardabweichung
Zn = (X .- EX) ./ sigma;
figure(6),bar(Zn, p),grid
title("fuer n=5")

% Berechnungen für 6 Würfel
n=6;
[A, B, C, D, E, F] = ndgrid(cube, cube, cube, cube, cube, cube);
posibilities = [ A(:) B(:) C(:) D(:) E(:) F(:) ]';
counts = PosibilitiesToCounts(posibilities, 6*n);
p = counts ./ ( 6 ^ 6 ); %Wahrscheinlichkeit
X = [1:36];
EX = sum(X .* p); %Erwartungswert
varianz = sum(((X .- EX)  .^ 2) .* p); %Varianz
sigma = sqrt(varianz); %Standardabweichung
Zn = (X .- EX) ./ sigma;
figure(7),bar(Zn, p),grid
title("fuer n=6")

%--------Aufgabe3--------------------------
clear %Variablen loeschen
fprintf("\n-----Aufgabe 3----- \n")
%Erwartungswert berechnen
function mu=erwartungswert(p,s)
  mu=s*p;
end
%Standardabweichung berechnen
function stand=standardabweichung(p,s)
  stand = sqrt(s*p*(1-p));
end
p=0.02;
s=250
erwartwert=erwartungswert(p,s)
standabweich=standardabweichung(p,s)
s=500
erwartwert=erwartungswert(p,s)
standabweich=standardabweichung(p,s)
s=1000
erwartwert=erwartungswert(p,s)
standabweich=standardabweichung(p,s)
s=2000
erwartwert=erwartungswert(p,s)
standabweich=standardabweichung(p,s)
%--------Aufgabe4--------------------------
clear %Variablen loeschen
fprintf("\n-----Aufgabe 4----- \n")
p=1/3 %Warscheinlich eines Treffers
n=5 %Anzahl Versuche
vers1=binopdf(0,n,p);
vers2=binopdf(1,n,p);
vers3=binopdf(2,n,p);
vers4=binopdf(3,n,p);
vers5=binopdf(4,n,p);
vers6=binopdf(5,n,p);
x=[0:5];
f=[ vers1 vers2 vers3 vers4 vers5 vers6 ];
figure(8),bar(x,f), 
title("Wahrscheinlichkeit fuer das Treffen der Scheiben"), 
xlabel("Treffer"), ylabel("p")