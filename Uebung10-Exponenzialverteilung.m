% ---------- Uebung 10 -----------
% s0556469 Laila Westphal
% s0556127 Alexander Tiedmann
% am 07/07/2017
% ---------- Vorbereitung ----------
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
%a)
fprintf("a) \n")
disp("Wert der Konstante C:")
C=1/q
%b)
fprintf("b) \n")
disp("Verteilungsfunktion der Zufallsgroesse X:")
% Verteilungsfunktion F(x) ist eine Stammfunktion der Dichtefunktion f(x)
% d.h. F'(x) = f1(x)
% Rechenweg siehe Zettel
F=C*(((x.^3)/3)-9*x.^2+81.*x);
disp("C*(((x.^3)/3)-9*x.^2+81.*x)")
f1=C*(9-x).^2;
%c)
fprintf("c) \n")
disp("Siehe Graphen")
figure(1)
subplot(1,2,1), plot(x,f1), title("Dichtefunktion")
subplot(1,2,2), plot(x,F), title ("Verteilungsfunktion")
%d)
fprintf("d) \n")
disp("Erwartungswert E und Standardabweichung SD der Zeitdauer X")
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
%a)
fprintf("a) \n")
disp("Wahrscheinlichkeitsfunktion der Anzahl der Einsaetze pro Woche")
x=[0:0.1:8];
E = 3.5; %Erwartungswert der Anzahl der Einsaetze pro Woche: 7/2
%Wahrscheinlichkeitsfunktion
function y = f(x)
  E=7/2;
  y=(E.^x./factorial(x)).*exp(-E);
end
disp("y=(3.5^x/x!)*e^-3.5")
y=poisspdf(x,E);
%Graphische Darstellung
figure(2),subplot(2,2,1),bar(x,y),title("Wahrscheinlichkeitsfunktion: Anzahl der Einsaetze/Woche mit X=8(Poisson-Verteilung)")
%b)
fprintf("b) \n")
disp("Wahrscheinlichkeit W fuer > 2 Einsaetze/Woche")
W= 1-f(0)-f(1)-f(2) %Wahrscheinlichkeit fuer mehr als 2 Einsateze
%c)
fprintf("c) \n")
disp("Dichte und Verteilungsfunktion der Zeit zw. 2 Braenden")
%Dichtefunktion
function y =fDichte(x)
  E=2; %Erwartungsert -> " Tage zwischen den Einsaetzen
  d=1/E;
  y=d*exp(-d*x);
end
%Verteilungsfunktion
function y= FVerteilung(x)
  E=2;
  d=1/E;
  y=1-exp(-d*x);
end
xc=[0:0.1:10];
%Graphische Darstellung
subplot(2,2,3),plot(xc,fDichte(xc)),title("Dichtefunktion der Zeit T")
subplot(2,2,4),plot(xc,FVerteilung(xc)),title("Verteilungsfunktion der Zeit T")
%d)
fprintf("d) \n")
disp("Wahrscheinlichkeit, dass die Feuerwehr innerhalb von 2 Tagen nach dem letzten Einsatz wieder ausruecken muss")
WahrschErneut = FVerteilung(2)
%e)
fprintf("e) \n")
disp("Wahrscheinlichkeit dafür, dass min. 5 Tage nach dem letzten Einsatz kein neuer stattfindet:")
FuenfTageKeiner = 1-FVerteilung(5)
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
%a) 
fprintf("a) \n")
% P fuer weniger als 9000h
stunden=9000; 
Pa=normcdf(stunden, t, sigma)
%b) 
fprintf("b) \n")
%P fuer Leuchtdauer zwischen 90000 und 10500
P1=normcdf(9000, t, sigma); %Wahrscheinlichkeit fuer 9000 Stunden
P2=normcdf(10500, t, sigma); %Wahrscheinlichkeit fuer 10500 Stunden
Pb=P2-P1
%c) 
fprintf("c) \n")
%80% Quantil-berechnen
qc=norminv(0.8,t,sigma) %Leuchtdauer die nicht ueberschritten wird (von 80% der Lampen)
%d) 
fprintf("d) \n")
%genau das gleiche wie C)
qd=norminv(0.1,t,sigma) %Leutdauer die mindestens erreicht wird (von 90% der Lampen)
%e) 
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
%a) 
fprintf("\n a) \n")
%pa=normpdf(37500,mu,sigma)
pa=normcdf(37500,mu,sigma)
%b) 
fprintf("\n b) \n")
%Integrieren 
pb=1-normcdf(45000,mu,sigma)
%c)
fprintf("\n c) \n")
min=42000;
pc=(1 - normcdf(min, mu, sigma))^4
%d)
fprintf("\n d) \n")
mi=38000;
p38000=normcdf(mi,mu,sigma); %ein Rad bis 38000
pd=binopdf(1,4,p38000)
%e) 
fprintf("\n e) \n")
%80%-Quantil berechnen
lebensdauer=norminv(0.2,mu,sigma)