clc, clear, close all;

printf("Kyle Knowles\n");
printf("couplded ODEs\n");
disp(date())


u0 = [pi/3.75 0]; %i angle and vi

% Final time
tf = 150; %seconds



% Using ode45 to solve for the solution
%tol = 1e-3;
tol = 1e-6;
options = odeset('RelTol', tol, 'AbsTol', tol);
[t,u] = ode45(@spring_mass_damper, [0 tf], u0, options);

% Print results
%create loop for values

% Print times
print_times = [0, 68.25];
for print_time=print_times
  for i=1:length(u0)
    printf("U_%i at time %i is %.8f\n", i, print_time, interp1(t,u(:,i),print_time));
  endfor
  printf("\n");
endfor

% Displacement vs Time Graph:

figure
plot(t,u(:,1))
grid
title(sprintf('Displacement from equilibrium vs t (tolerance: %.0e)',tol))
legend('x(t)')
xlabel('Time (s)')
ylabel('Displacement')

% Velocity vs time graph:

figure;
plot(t,u(:,2),'b')
grid
title(sprintf('Velocity vs t (tolerance :%0.e)', tol))
legend('Velocity')
xlabel('Time (s)')
ylabel('xdot(t)')

% Velocity vs time Graph:
figure;
plot(u(:,1),u(:,2),'b')
grid
title(sprintf('Poincare Diagram (tolerance: %.0e)',tol))
legend('Trace')
xlabel('x(t)')
ylabel('xdot(t)')
