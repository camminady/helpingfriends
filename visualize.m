function visualize

close all

load analyzedata
load hamburgdata.mat
UniqueStationKurz = unique(data.StationKurz);

for i=30:41
    
    % smoothening or not?
        f = @(x) x; % identity, e.g. no smoothening
    f = @(x) smoothperiodic(x,15); % smoothening over 60 minutes
    
    figure
    plot((1:60*24)/60-eps,f(Count(:,1,i)));%./(Count(:,3,i)+eps)));
    hold on
    plot((1:60*24)/60-eps,f(Count(:,2,i)));%./(Count(:,3,i)+eps)),'r');
    plot((1:60*24)/60-eps,10*f(Count(:,3,i)));
    
    plot((1:60*24)/60-eps,10*f(Count(:,1,i)./(Count(:,3,i)+eps)));
    plot((1:60*24)/60-eps,10*f(Count(:,2,i)./(Count(:,3,i)+eps)));
    legend('Outflux','Influx','10*#Observations','10*Outflux/#Obs','10*Influx/#Obs',...
        'Location','NorthWest')
    grid on
    
    rows = data.StationKurz==UniqueStationKurz(i);
    ii = find(rows);
    name = data(ii(1),'Station');
    
    title(string(name.Station))
    
end




spread

end
