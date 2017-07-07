% ---------- Uebung 8 -----------
% s0556469 Laila Westphal
% s0556127 Alexander Tiedmann
% am 05.05.2017
%---------------Vorbereitung---------------
%Befehlsfenster saubern
clc;
%Alle Variablen loeschen
clear;
%output paging ausschalten, so, 
%dass das sktipt ohne anhalten durchlaeuft
more off

%-----------------Bemerkungen--------------
%r=poly(nzp) % aus Nullstellen wieder Polynom machen
%polyout(np,"x") Printbefehl fuer polynome

%--------Aufgabe1--------------------------
fprintf("-----Aufgabe 1----- \n")
zp=[4 0 0 0 -4]; %Zaehlerpolynom
np1=[1 -2]; % Linearfaktor 1
np2=[1 2]; %Liearfaktor 2
np=conv(np1,np2) % Nennerpolynom = Produkt beider Linearfaktoren
printf("Nullstellen des Zaehlerpolynoms bei:\n");
nzp=roots(zp) %Nullstellen Zaehlerpolynom
[qp, rp]=deconv(zp,np) %Polynomdivision mit qp = ganzrationale Funktion und qr = Divisionsrest
%qp ganzrationale Funktion
%rp echt gebrochen rationale Funktion
[r, xP, g]=residue(rp,np) %Partialbruchzerlegung
% r Zähler Partialbrüche
% xP Polstellen PB
% g ganzrationaler Teil
%--------Aufgabe2--------------------------
fprintf("\n-----Aufgabe 2----- \n")
%a)
fprintf("\n##a)## \n")
[ra, xPa, ga]=residue([2],[1 0 -1]) %Partialbruchzerlegung
%b)
fprintf("\n##b)## \n")
[rb, xPb, gb]=residue([2 3],[1 3 2]) %Partialbruchzerlegung
%c)
fprintf("\n##c)## \n")
[rc, xPc, gc]=residue([1 1 1 2],[1 0 3 0 2]) %Partialbruchzerlegung
%d)
fprintf("\n##d)## \n")
[rd, xPd, gd]=residue([2 -14 14 30],[1 0 -4]) %Partialbruchzerlegung
% r Zähler Partialbrüche
% xP Polstellen PB
% g ganzrationaler Teil
%--------Aufgabe3--------------------------
fprintf("\n----------Aufgabe 3----------\n")
%a
fprintf("a) ")
kA = [1 0 0 0 0 0 -1 0];
nsA=roots(kA) %Komplexe Nullstellen
figure(1),compass(nsA) %Grafische Darstellung in der komplexen Ebene
%b
fprintf("b) ")
kB = [1 1 1 1 1 1];
knB=roots(kB) %Komplexe Nullstellen
figure(2),compass(knB) %Grafische Darstellung in der komplexen Ebene
%c
fprintf("c) ")
kC = [1 0 0 -j];
knC=roots(kC) %Komplexe Nullstellen
figure(3),compass(knC) %Grafische Darstellung in der komplexen Ebene