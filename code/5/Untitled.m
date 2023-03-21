fid=fopen('nmea_20193160759.txt', 'r'); %打开文件
lat=[];
lon=[];
count=0;
while ~feof(fid)
    str=fgetl(fid);
    k=strfind(str,'$GPGGA');
    if isempty(k)
    else
        count=count+1;
        c=strsplit(str,',');
        latitude=fix(str2double(c{4})/100)+(str2double(c{4})-fix(str2double(c{4})/100)*100)/60;
        if c{5}=="S"
            latitude=-latitude;
        end
        lat(:,count)=latitude;
        longtitude=fix(str2double(c{6})/100)+(str2double(c{6})-fix(str2double(c{6})/100)*100)/60;
        if c{7}=="W"
            longtitude=-longtitude;
        end
        lon(:,count)=longtitude;
    end
end
filename = 'track.kml';
kmlwriteline(filename,lat,lon);
