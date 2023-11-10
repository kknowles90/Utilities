function [t, y] = euler_solver(f, dt, tf, yo)
  N = ceil(tf/dt)
  
  % discretize time into the number of steps
  t = 0:dt:dt*N;
  
  y(1) = yo;
  for i=1:N
    % Euler : y(t+dt)= y(t) + dt * y'[t,y(t)]
    
    y(i+1) = y(i) + dt*f(t(i), y(i));
  endfor
  
endfunction
