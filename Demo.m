clear
pt = [0,0;1,0;1,1;0,1;0,0]';

pt_h = [pt;ones(1,5)];

%T = rand(3,3);
%T= [0.9961    0.1067    0.7749;
    %0.0782    0.9619    0.8173;
    %0.4427    0.0046    0.8687]
T =[0.1361    0.5499    0.6221;
    0.8693    0.1450    0.3510;
    0.5797    0.8530    0.5132];
T = rand(3,3);

tpt_h = T*pt_h;

tpt = bsxfun(@rdivide, tpt_h(1:2,:), tpt_h(3,:));

figure; axis equal;
plot(pt(1,:),pt(2,:),'LineWidth',4); hold on;
plot(tpt(1,:),tpt(2,:),'LineWidth',4);

% decompose
[r,u,k,n] = TransformDecompose(T);
theta_r = acos(r(1));
theta_u = acos(u(1));

% normalise the rotations (unit rotation)
n_r = r(2:4)/sin(theta_r);
n_u = u(2:4)/sin(theta_u);

state0 = [0;0;1;1;1]; % initial state
state1 = [theta_r;theta_u;k(1:3)]; % final state

spac = linspace(0,1,20); % definte interpolation steps

% interpolate
istate = interp1([0,1],[state0,state1]',spac,'linear')';

for i=1:20
    ir = [cos(istate(1,i));n_r*sin(istate(1,i))];
    iu = [cos(istate(2,i));n_u*sin(istate(2,i))];
    ik(1:3) = istate(3:5,i);
    % get rotation matrix from quaternion
    R = quat2rotm(ir);
    U = quat2rotm(iu);
    K = diag(ik);
    iT = R*(U*K*U')*n;

    tpt_h = iT*pt_h;

    tpt = bsxfun(@rdivide, tpt_h(1:2,:), tpt_h(3,:));

    plot(tpt(1,:),tpt(2,:));

    pause(0.2);

end
