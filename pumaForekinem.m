a=[0;0;1;1];
alp=[0;-90;0;0];
d=[0;0;0;0];

% for any random angle
%theta=[30;45;60;57];
theta=input("theta");

%for 2 or 3 input angle take angle as a input from user
% for i=1:4
%     theta(i)=input(num2str(i));
% end

I=eye(4);

for i=1:4
    T=[cosd(theta(i))                 -sind(theta(i))                 0                            a(i);
          sind(theta(i))*cosd(alp(i))    cosd(theta(i))*cosd(alp(i))     -sind(alp(i))                -sind(alp(i))*d(i);
          sind(theta(i))*sind(alp(i))    cosd(theta(i))*sind(alp(i))     cosd(alp(i))                 cosd(alp(i))*d(i);
          0                              0                               0                            1];
    if(i==1)
        T1=T;
    end

    if(i==2)
        T2=T;
    end
    if(i==3)
        T3=T;
    end
    if(i==4)
        T4=T;
    end    
end

%end point of link 4
T=T1*T2*T3*T4;
pos=T*[0;0;0;1];
X4=pos(1);
Y4=pos(2);
Z4=pos(3);

%end point of link 3
T=T1*T2*T3;
pos=T*[0;0;0;1];
X3=pos(1);
Y3=pos(2);
Z3=pos(3);
 
%cordinate of link1 and link2 is at origin
X1=0;
Y1=0;
Z1=0;

X=[X1 X3 X4];
Y=[Y1 Y3 Y4];
Z=[Z1 Z3 Z4];

scatter3(X,Y,Z)
hold on
plot3(X,Y,Z)
hold off





