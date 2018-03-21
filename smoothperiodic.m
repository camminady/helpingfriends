function y = smoothperiodic(x,N)

[n,m] = size(x);

if m==1
    x = [x;x;x];
    y = smooth(x,N);
    y = y(n+1:2*n);
else
    x = [x,x,x];
    y = smooth(x,N);
    y = y(m+1:2*m);
end


end
