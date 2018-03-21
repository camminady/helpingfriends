function analzye



load hamburgdata.mat

head(data)

UniqueStationKurz = unique(data.StationKurz);

length(UniqueStationKurz)
for k=1:length(UniqueStationKurz)
    k
    
    rows =data.StationKurz == UniqueStationKurz(k);
    tmp = data(rows,:);
    
    tmpMinutes = tmp.Abfahrt.Minute;
    tmpHours = tmp.Abfahrt.Hour;
    timeInMinutes = tmpMinutes+60*tmpHours;
    
    count = zeros(60*24,3);
    
    for i=1:60*24
        rows = timeInMinutes ==i;
        a=data(rows,'Einsteiger');
        
        if isempty(a)
            x=0;
        else
            x=sum(a.Einsteiger);
        end
        a=data(rows,'Aussteiger');
        if isempty(a)
            y=0;
        else
            y=sum(a.Aussteiger);
        end
        
        count(i,1)=x;
        count(i,2)=y;
        if isempty(a)
            count(i,3) = 0;
        else
        count(i,3)=length(a.Aussteiger);
        end
    end
    Count(:,:,k) = count;
    
end

keyboard
