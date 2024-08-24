% for given any end point p4;
p=input("p4");
% first we find theta3 
c3= (p(3)*p(3)+p(1)*p(1)+p(2)*p(2)-2)/2;
s3=sqrt(1-c3*c3);
theta3=atand(s3/c3); 
% Inverse 
% now we find theta1
%theta1=atand(y/x);
% now we find theta2;
x=p(1);
y=p(2);
z=p(3);
a=x*x+y*y+z*z+2*sqrt(x*x+y*y);
b=4*z;
c=x*x+y*y+z*z-2*sqrt(x*x+y*y);
theta1=atand(y/x);
theta2_1=2*atand((-b+sqrt(b*b-4*a*c))/2*a);
theta2_2=2*atand((-b-sqrt(b*b-4*a*c))/2*a);
theta=[theta1, theta2_1, theta3, 40];
% theta4 any random value;
% a is the shortest distance between z axis;
a=[0; 0; 1; 1];
alpha=[0; -90; 0; 0];
d=[0; 0; 0; 0];
% We know link transformation matrix;
T = @(i) [cosd(theta(i)), sind(theta(i)), 0, a(i);
      sind(theta(i)) * cosd(alpha(i)), cosd(theta(i))*cosd(alpha(i)), sind(alpha(i)), d(i)*sind(alpha(i)); 
    sind(theta(i))*sind(alpha(i)), cosd(theta(i))*sind(alpha(i)), cosd(alpha(i)), d(i)*cosd(alpha(i));
    0, 0, 0, 1
    ];
Tf=eye(4);
for x=1:4
    Tf=Tf*T(x);
end
p4=T(1)*T(2)*T(3)*T(4)*[0;0;0;1];
p3=T(1)*T(2)*T(3)*[0;0;0;1];
p2=T(1)*T(2)*[0;0;0;1];
% p2 is at origin
z=[p2(3), p3(3), p4(3)];
x=[p2(1), p3(1), p4(1)];
y=[p2(2), p3(2), p4(2)];

scatter3(x,y, z);
hold on;
plot3(x, y, z);
hold off;
