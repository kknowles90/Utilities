clc;
clear all;
close all;

printf("============================================================\n")
fprintf("ODEs\n");
printf("Kyle Knowles\n")
display(date())
printf("============================================================\n\n")




p=16600;
cp=160;
h=150;
d=3e-3;
r=d/2;
To=550;
b=3;
Arc=4*pi*(r)^2;
Vc=(4/3)*pi*(r)^3;
e=0.8;
o=5.68e-8;
T_inf=@(t) To + b*t;
dTdt=@(t,T) ((Arc*(h+(e*o*(T^2+(To+3*t)^2)*(T+To+3*t))))/(p*Vc*cp))*T_inf(t) -...
((Arc*(h+(e*o*(T^2+(To+3*t)^2)*(T+To+3*t))))/(p*Vc*cp))*T;

%dVdt = @(t,V) -V/(R*C); %Volts/second


%Vo = 20; %Volts
tf = 200; %Seconds
print_time = [50, 150, 200]; %Seconds
dt = [5, 20, 40]; %Seconds
tol = [10e-3, 10e-6];


% choosing timestep for convergence:
% dt small enough that V doesn't overshoot the final value(0) by 2x
% same way that omega is always < 2


%Using Euler's Method
for i = 1:length(dt)
  fprintf("Using dt = %.4f\n",dt(i));
  [time, sol] = euler_solver(dTdt, dt(i), tf, To);

  for j = 1:length(print_time)

    fprintf('Euler: %.4f at t = %.4f\n', interp1(time,sol,print_time(j)),print_time(j));
  endfor
  figure

  plot(time,sol,"linewidth",3)
  title(sprintf("Temperature vs. Time for dt = %.3f\n",dt(i)));
  fprintf("\n");
  end

%Using adaptive Runge-Kutta 4th order methods
for i = 1:length(tol)
  fprintf("Using tol = %.4e\n",tol(i));
  for j = 1:length(print_time)
    opt = odeset ("RelTol", tol(i), "AbsTol", tol(i));
    [time_octave, sol_octave] = ode45(dTdt, [0,tf], To, opt);
    fprintf("ODE45: %.4f at t = %.4f\n", interp1(time_octave,sol_octave,print_time(j)),print_time(j));
    plot(time_octave,sol_octave,"r","linewidth",3);
    endfor
end
