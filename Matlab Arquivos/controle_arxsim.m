% A1=[1.01084017733551 -0.453091619596496 0.434089118323531;1 0 0;0 1 0];
% B1=[1;0;0];
% C1=[-0.00201156891470309 0.00830655499096105 -0.00159148144691719];
% D1=[-0.00366625510693185];
A1=A;
B1=B;
C1=C;
D1=D;
Ts=0.05;
% -4 + 4.0012 i
% -4 - 4.0012 i
% -8
z=0.9;
wn=4;
r=roots([1 2*wn*z wn^2]);
z1=exp(r(1)*0.05);
s3=-14;

z1=exp(r(1)*0.05); z2=exp(r(2)*0.05); z3=exp(s3*Ts);

F=blkdiag([real(z1) imag(z1); imag(z2) real(z2)], z3);
kb=[1 1 1];
% rank(obsv(F,kb))

 t1=lyap(A1,-F, -B1*kb);
 k1=kb*inv(t1);
%  eig(A1-B1*k1)

Garx=ss(A1-B1*k1,B1,C1,D1,Ts);
% step(Garx)
stepinfo(Garx);
mul=3;
s1=real(r(1))*mul+imag(r(1))*j; s2=real(r(2))*mul +imag(r(2))*j; s3=s3*mul;
z1=exp(s1*Ts); z2=exp(s2*Ts); z3=exp(s3*Ts);
z1=exp(r3(3)*0.05); z2=exp(r3(2)*0.05);z3=exp(r3(1)*0.05);

F2=blkdiag([real(z1) imag(z1); imag(z2) real(z2)], z3);

kb=[1 1 1];

lb=[1 1 1]';
r1=rank(ctrb(F2,lb))

t2=lyap(F2,-A1,lb*C1);

l1=inv(t2)*lb;
eig(F2)'
eig(A1-l1*C1)'
Garx2=ss(A1-l1*C1,B1,C1,D1,Ts);
