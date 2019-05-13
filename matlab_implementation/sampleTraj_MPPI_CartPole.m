function [Stk,delta_u,x]=sampleTraj_MPPI_CartPole(...
                            k,N,variance,Stk,...
                            x,delta_u,u,...
                            R, mc, mp, l, g, kd, dt...
                            )
            for i = 1:N-1
                delta_u(i,k) = variance*(randn(1));
                x(:,i+1) = x(:,i) + CartPole_Dynamics(...
                    x(1,i),...
                    x(2,i),...
                    x(3,i),...
                    x(4,i),...
                    (u(i)+delta_u(i,k)),...
                    mc, mp, l, g, kd)*dt;
                
                Stk(k) = Stk(k) + cost_function_cartpole(...
                    x(1,i+1),...
                    x(2,i+1), ...
                    x(3,i+1), ...
                    x(4,i+1),...
                    (u(i)+ delta_u(i,k)),...
                    dt, R);

            end
end % end function