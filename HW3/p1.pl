% axioms
:- dynamic room/4.
room(z6,120,projector,null).
room(z10,90,smartboard,null).
room(z11,30,smartboard,handicapped).

occupancy(z6,8,cse341).
occupancy(z6,9,cse341).
occupancy(z6,10,cse341).
occupancy(z10,9,cse321).
occupancy(z10,10,cse321).
occupancy(z10,11,cse321).
occupancy(z11,13,cse331).
occupancy(z11,14,cse331).
occupancy(z11,15,cse331).
occupancy(z6,13,cse343).
occupancy(z6,14,cse343).
occupancy(z6,15,cse343).
occupancy(z6,16,cse343).

course(cse341,yakupgenc,70,3,z6,projector).
course(cse343,habilkalkan,100,4,z6,projector).
course(cse331,alparslanbayrakci,60,3,z11,smartboard).
course(cse321,didemgozupek,80,3,z10,smartboard).
course(cse441,didemgozupek,20,3,_,smartboard).

instructor(yakupgenc,cse341,projector).
instructor(habilkalkan,cse343,projector).
instructor(alparslanbayrakci,cse331,smartboard).
instructor(didemgozupek,cse321,smartboard).
instructor(didemgozupek,cse441,smartboard).

student(967,cse341,null).
student(967,cse343,null).
student(868,cse321,handicapped).
student(868,cse331,handicapped).
student(868,cse341,handicapped).
student(868,cse343,handicapped).
student(853,cse343,null).
student(853,cse331,null).
student(452,cse341,null).
student(865,cse331,handicapped).
student(865,cse341,handicapped).
student(439,cse321,null).
student(528,cse331,null).
student(528,cse321,null).
student(279,cse321,null).
student(279,cse343,null).
student(720,cse341,null).
student(505,cse331,null).
student(505,cse343,null).

% queries

conflict(Course1,Course2) :- occupancy(Room1,Time1,Course1),
    occupancy(Room2,Time2,Course2),
    (Room1==Room2),
    (Time1==Time2).

assign(Class1,Z) :- course(Class1,_,Capacity1,_,_,Equipment1),
    room(_,Capacity2,Equipment1,_),
    (Capacity1 =< Capacity2),
    room(Z,Capacity2,Equipment1,_).

assignRoom(Room2,X) :- room(Room2,Capacity3,Equipment3,_),
    course(_,_,Capacity4,_,_,Equipment3),
    (Capacity4=<Capacity3),
    course(X,_,Capacity4,_,_,Equipment3).

enroll(StudentID,Class3) :- course(Class3,_,_,_,Room3,_),
    student(StudentID,_,Need1),
    room(Room3,_,_,Need2),
    (Need2=='handicapped' ; (Need1==Need2)).

assignClass(StudentID,Y) :- student(StudentID,_,Need3),
    ((Need3=='handicapped'),
    room(Room4,_,_,handicapped),
    course(Y,_,_,_,Room4,_);
    (Need3=='null'),
    course(Y,_,_,_,_,_)).

addRoom(A,B,C,D) :- \+room(A,_,_),assert(room(A,B,C,D)).
