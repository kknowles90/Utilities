function[udot] = spring_mass_damper(t,u)
  g = 9.81;
  k = 0.406737;
  L = 60;
  c = 0;
  %c=0.25;
  
  %ODE to solve
  %m*u'' + c*u' + k*u = m*g - k*L
  udot(1,1) = u(2);
  udot(2,1) = -(g/L)*sin(u(1))-c*u(2)*abs(u(2));
endfunction