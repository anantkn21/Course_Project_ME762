%initial length
l1=10;
l2=10;

%initial angles
theta1_init=0;
theta2_init=0;

%final angles
theta1_fin=40;
theta2_fin=60;

steps=100;
d01=theta1_fin/steps;
d02=theta2_fin/steps;

th1=0:d01:theta1_fin;
th2=0:d02:theta2_fin;

for i=1:100
    a=[0 l1 l2];
    alpha=[0 0 0];
    d=[0 0 0];
    the=[th1(i) th2(i) 0];

    %calculating tranformaation matrix
    c1=cosd(th1(i));
    c2=cosd(th2(i));
    s1=sind(th1(i));
    s2=sind(th2(i));

    T1=[c1 -s1 0 0;
        s1 c1 0 0;
        0 0 1 0;
        0 0 0 1];


    T2=[c2 -s2 0 l1;
        s2 c2 0 0;
        0 0 1 0;
        0 0 0 1];

    T3=[1 0 0 l2;
        0 1 0 0;
        0 0 1 0;
        0 0 0 1];


    joint1_pos=T1*T2*[0;0;0;1];
    joint2_pos=T1*T2*T3*[0;0;0;1];
    X=[0 joint1_pos(1) joint2_pos(1)];
    Y=[0 joint1_pos(2) joint2_pos(2)];

    hg=hggroup;
    plot(X,Y,'-bo',"LineWidth",3,'MarkerEdgeColor','k','Parent',hg);
    xlabel("x-coordinate");
    ylabel("y-coordinate");
    title("Forward kinematics");
    pause(0.05);
    axis([-20 20 -20 20])
    axis manual;
    grid on;
    hold on;
    frame=getframe(gcf);
    if i<100
        delete(hg)
    end
end
X=joint2_pos(1);
Y=joint2_pos(2);


