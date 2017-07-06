clc
%Alle Variablen loeschen
clear;
%output paging ausschalten, so, 
%dass das sktipt ohne anhalten durchlaeuft
more off

%--------Aufgabe1--------------------------
fprintf("-----Aufgabe 1----- \n")
clear % Variablen loeschen

function y = f(x)
  y=(9-x).^2;
endfunction
  x=[0:0.1:9];
  q=quad(@f,0,9);%Integral ueber f(x) im Bereich 0 bis 9
  disp("a) Wert der Konstante C:")
  C=1/q
  
  disp("b) Verteilungsfunktion der Zufallsgroesse X:")
  % Verteilungsfunktion F(x) ist eine Stammfunktion der Dichtefunktion f(x)
  % d.h. F'(x) = f1(x)
  % Rechenweg siehe Zettel
  F=C*(-1/3.*(9-x).^3);
  disp("F=C*(-1/3.*(9-x).^3)")
  f1=C*(9-x).^2;
  disp("c) Siehe Graphen")
  figure(1)
  subplot(1,2,1), plot(x,f1), title("Dichtefunktion")
  subplot(1,2,2), plot(x,F), title ("Verteilungsfunktion")
  
  disp("d) Erwartungswert E und Standardabweichung SD der Zeitdauer X")
  %Erwartungswert E(X)
  
  E=quad(@(x) x*C*(9-x).^2,0,9)
  
  %Varianz
  Var=quad(@(x) (x-E).^2*C*(9-x).^2,0,9);
  
  %Standardabweichung
  SD=sqrt(Var)%SD = Standard Deviation
  
  disp("Erwartungswert und Standardabweichung des Rechnungsbetrages")
  
  ERechnungsbetrag=30 + 80*E
  SDRechnungsbetrag=SD*80

%--------Aufgabe2--------------------------
clear %Variablen loeschen
fprintf("\n-----Aufgabe 2----- \n")
% Funktion finden (wie bei 1b)
% bedingte Wahrscheinlichkeiten
% versteckte Angabe in der Aufgabe: mu = ca. alle 2 Tage

%--------Aufgabe3--------------------------
clear %Variablen loeschen
fprintf("\n-----Aufgabe 3----- \n")
messung=[10 8 9 10 11 11 9 12 8 12];
n=10; %Anzahl Proben
[zeilenanz,spaltenanz]=size(messung);
x=(sum(messung)/spaltenanz); %Mittelwert
sigmaQuad=4; %Varianz
sigma=sqrt(sigmaQuad); %Standardabweichung
gamma=0.95; %Wahrscheinlichkeit
phic=(gamma+1)/2;
c=stdnormal_inv(phic);%oder aus Tabelle (1.96)
ckleinermu=x-((c*sigma)/sqrt(n));
cgroessermu=x+((c*sigma)/sqrt(n));
[mu]=[ckleinermu cgroessermu]

%--------Aufgabe4--------------------------
clear %Variablen loeschen
fprintf("\n-----Aufgabe 4----- \n")
t=10000; %durchschnittliche Leuchtdauer (mu)
sigma=800; %Standardabweichung
sigmaQuad=sigma.^2; %Varianz
%a) % P fuer weniger als 9000h
fprintf("a) \n")
stunden = 9000-1;
Pa=normcdf(stunden, t, sigma)
%b) P fuer Leuchtdauer zwischen 90000 und 10500
fprintf("b) \n")
P1=normcdf(9000, t, sigma); %Wahrscheinlichkeit fuer 9000 Stunden
P2=normcdf(10500, t, sigma); %Wahrscheinlichkeit fuer 10500 Stunden
Pb=P2-P1
%c) 80% Quantil-berechnen
fprintf("c) \n")
qc=norminv(0.8,t,sigma) %Leuchtdauer die nicht ueberschritten wird (von 80% der Lampen)
%d) genau das gleiche wie C)
fprintf("d) \n")
qd=norminv(0.1,t,sigma) %Leutdauer die mindestens erreicht wird (von 90% der Lampen)
%e) bedingte Wahrscheinlichkeit
fprintf("e) \n")
%Bedingung: schon 9000 stunden geleuchtet
%Wahrscheinlichkeit: nach 10500 stunden noch leuchtet
bed9000=1-P1;
bed10500=1-P2;
pe=bed10500/bed9000
%--------Aufgabe5--------------------------
clear %Variablen loeschen
fprintf("\n-----Aufgabe 5----- \n")
mu=40000; %Durchschnittliche Lebensdauer (KM)
sigma=4310; %Standardabweichung
% ausgehen von einer Gauss-Verteilung
%a) direkt Wahrsceinlichkeit
fprintf("\n a) \n")
pa=normpdf(37500,mu,sigma)%----------------------------falsch???
%b) Integrieren 
fprintf("\n b) \n")
pb=1-normcdf(45000,mu,sigma)
%c) vier unabhängige Experimente (zur Not Baumdiagramm)
fprintf("\n c) \n")
min=42000;
pmin42000=1-normcdf(min-1,mu,sigma);
pc=binopdf(4,4,pmin42000)
%d)
fprintf("\n d) \n")
p38000=normcdf(38000,mu,sigma);
pd=binopdf(1,4,p38000)
%e) 80%-Quantil berechnen
fprintf("\n e) \n")
levensdauer=norminv(0.2,mu,sigma)