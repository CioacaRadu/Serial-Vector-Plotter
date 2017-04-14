s = serial('com3');

loop = 578;

if strcmp(s.Status,'closed')
    fopen(s);
end

count = 0; 

p0 = [0 0 0];
while( count ~= loop ) 
    output = fscanf(s);
    splitoutput = strsplit(output,',');
    

    x = str2double(splitoutput(1));
   y = str2double(splitoutput(2));
   z = str2double(splitoutput(3));
   p1 = [x y z];
    
    fprintf('%f %f %f\n',x,y,z)
    

a = [x y z];
b = [1 1 0];
c = a+b;

starts = zeros(3,3);
ends = [a;b;c];

quiver3(starts(:,1), starts(:,2), starts(:,3), ends(:,1), ends(:,2), ends(:,3))
xlabel('x')
ylabel('y')
zlabel('z')
axis equal


    
    drawnow;
    count = count + 1;
    
 
    
end

fclose(s);
delete(s);
clear s;
