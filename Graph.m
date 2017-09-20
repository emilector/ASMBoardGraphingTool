clear all; clc;

% Enter "GraphData" Location (In VS "GraphProject" -> Debug) %

path = "E:/TFS/70x/src/ModelComps/ComponentSetupModel/Test/BoardGraphingTool/GraphProject/bin/Debug/GraphData/";

x = load("-ascii", strcat(path, "swX.txt"));
y = load("-ascii", strcat(path, "swY.txt"));
z = load("-ascii", strcat(path, "swZ.txt"));

fid = fopen (strcat(path, "octaveSettings.txt"));
Name = fgets (fid)
Range = fgets(fid)
fclose (fid);

RangeDbl = str2num(Range)

figure(1)

plot3(x,y,z,'*');

title (Name);
xlabel ("X-Achse");
ylabel ("Y-Achse");
zlabel ("Z-Achse");

figure(2)
plot(x, y, '*')

title ("2D Ansicht");
xlabel ("X-Achse");
ylabel ("Y-Achse");

figure(1,"position",get(0,"screensize")([3,4,3,4]).*[0.1 0.2 0.8 0.7])

xlin = linspace(min(x),max(x),RangeDbl);  
ylin = linspace(min(y),max(y),RangeDbl);  
[X,Y] = meshgrid(xlin,ylin); 
Z = griddata(x,y,z,X,Y);    

hold on;  
plot3(x,y,z, '*');  
surf(X,Y,Z);  
grid on;
hold off; 


