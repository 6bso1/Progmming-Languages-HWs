% axioms

flight(canakkale,erzincan,6).
flight(erzincan,canakkale,6).

flight(erzincan,antalya,3).
flight(antalya,erzincan,3).		

flight(istanbul,izmir,2).
flight(izmir,istanbul,2).

flight(izmir,antalya,2).
flight(antalya,izmir,2).

flight(antalya,diyarbakir,4).
flight(diyarbakir,antalya,4).

flight(diyarbakir,ankara,8).
flight(ankara,diyarbakir,8).

flight(ankara,istanbul,1).
flight(istanbul,ankara,1).

flight(ankara,izmir,6).
flight(izmir,ankara,6).

flight(rize,ankara,5).
flight(ankara,rize,5).

flight(rize,istanbul,4).
flight(istanbul,rize,4).

flight(ankara,van,4).
flight(van,ankara,4).

flight(gaziantep,van,3).
flight(van,gaziantep,3).

% queries

route(X,Y,C) :- flight(X,Y,C). 
route(X,Y,C) :- cost(X , Y , C , []). 

cost(X , Y , C , _) :- flight(X , Y , C).
cost(X , Y , C , V) :- \+ member(X , V), flight(X , Z , A), 					
							cost(Z , Y , B , [X|V]), X\=Y, C is A + B.		