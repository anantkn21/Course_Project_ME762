%first define initial and final position which is in workspace or workvolume of robot
%pos_init=[0.5 0.75 1];
%pos_fin=[0.13 0.65 1];
pos_init=input("pos_init");
pos_fin=input("pos_fin");
% pos_init=[1 1 1];
% pos_fin=[1 0.25 1];

% pos_init=[1 0.5 0.75];
% pos_fin=[0.13 1 0.65];

%from these postiton we find initial angles and final angles

%initial angle at time=0
theta1_init=atand(pos_init(2)/pos_init(1));
theta3_init=atand(sqrt(4-(pos_init(1)^2+pos_init(2)^2+pos_init(3)^2-2)^2)/(pos_init(1)^2+pos_init(2)^2+pos_init(3)^2-2));
a_init=(pos_init(1)/cosd(theta1_init))^2+pos_init(3)^2+(2*pos_init(1)/cosd(theta1_init));
b_init=4*pos_init(3);
c_init=(pos_init(1)/cosd(theta1_init))^2+pos_init(3)^2-(2*pos_init(1)/cosd(theta1_init));
theta2_init=2*atand((-b_init+sqrt(b_init^2-(4*a_init*c_init)))/(2*a_init));


% final angle at time=3sec
theta1_fin=atand(pos_fin(2)/pos_fin(1));
theta3_fin=atand(sqrt(4-(pos_fin(1)^2+pos_fin(2)^2+pos_fin(3)^2-2)^2)/(pos_fin(1)^2+pos_fin(2)^2+pos_fin(3)^2-2));
a_fin=(pos_fin(1)/cosd(theta1_fin))^2+pos_fin(3)^2+(2*pos_fin(1)/cosd(theta1_fin));
b_fin=4*pos_fin(3);
c_fin=(pos_fin(1)/cosd(theta1_fin))^2+pos_fin(3)^2-(2*pos_fin(1)/cosd(theta1_fin));
theta2_fin=2*atand((-b_fin+sqrt(b_fin^2-(4*a_fin*c_fin)))/(2*a_fin));



time=3; %Consider time=3sec
timeinterval=10;
dt=time/timeinterval;

for i=1:11
    t=(i-1)*dt;
    a_no_1=theta1_init;
    a_one_1=0;
    a_two_1=3*(theta1_fin-theta1_init)/time^2;
    a_thre_1=2*(theta1_init-theta1_fin)/time^3;

    theta1=(a_no_1+(a_one_1*t)+(a_two_1*t*t)+(a_thre_1*t*t*t));

    a_no_2=theta2_init;
    a_one_2=0;
    a_two_2=3*(theta2_fin-theta2_init)/time^2;
    a_thre_2=2*(theta2_init-theta2_fin)/time^3;

    theta2=(a_no_2+(a_one_2*t)+(a_two_2*t*t)+(a_thre_2*t*t*t));

    a_no_3=theta3_init;
    a_one_3=0;
    a_two_3=3*(theta3_fin-theta3_init)/time^2;
    a_thre_3=2*(theta3_init-theta3_fin)/time^3;

    theta3=(a_no_3+(a_one_3*t)+(a_two_3*t*t)+(a_thre_3*t*t*t));
    
    pos1=[0 0 0]; % as distance d we have taken a zero
    pos2=[cosd(theta1)*cosd(theta2) sind(theta1)*sind(theta2) -sind(theta2)];
    l=(cosd(theta1)*cosd(theta2+theta3))+(cosd(theta1)*cosd(theta2));
    m=(sind(theta1)*cosd(theta2+theta3))+(sind(theta1)*cosd(theta2));
    n=(-sind(theta2+theta3)-sind(theta2));
    pos3=[l m n];

    X=[pos1(1) pos2(1) pos3(1)];
    Y=[pos1(2) pos2(2) pos3(2)];
    Z=[pos1(3) pos2(2) pos3(3)];

    ak=hggroup;
    plot3(X,Y,Z,"LineWidth",1);

    axis([-2 2 -2 2 -2 2]);
    pause(0.5) % show time of one frame
    xlabel("X-coordinate (units)");
    ylabel("Y-coordinate (units");
    zlabel("Z-coordinate (units)");
    axis manual;
    grid on;
    hold on;

    % if(i<11)
    %     delete(ak);
    % end    


end    
