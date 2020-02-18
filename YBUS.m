clc
clear
n=input(' Enter the number of buses :');
p=1;
while p==1
    m=input(' Enter \n "1" if you want to insert the "Impedence" \n "2" if you want to insert the "Admittance"\n --> ');
    if (m==1)
        fprintf('\n Enter the value of Impedence \n')
        fprintf('-----------------------------------------')
        break
    elseif (m==2)
        fprintf('\n Enter the value of Admittance \n ')
        fprintf('------------------------------------------ \n')
        break
    else
        fprintf('Invalid input \n')
    end
end
for i=1:n
         for j=(i+1):n
            a(i,j)=0;
            fprintf('\n\nEnter the value between bus %d to bus %d\n -->' ,i,j)
            a(i,j)=input('');
            if m==1 && a(i,j)~=0
                a(i,j)=1./a(i,j);
            end
            a(j,i)=a(i,j);
         end
end
q=1
while q==1 
    fprintf('\n \n If you have the value of self impedence or admittance?\n "1" if yes \n "2" if no\n-->')
         s=input('');
         if (s==1 | s==2)
            break
         end
end
r=1
while r==1
             fprintf('Press "1" for self impedence \n"2" for self admittance \n')
            sa=input('');
            if (sa==1 | sa==2)
                break
            end
end
if (sa==2)
            for i=1:n
                fprintf('Enter the value of self admittance of  bus %d \n-->' ,i)
                a(i,i)=input('');
                    end
end
if (sa==1)
                for i=1:n
                fprintf('Enter the value of self impedence of  bus %d \n-->' ,i)
                a(i,i)=input('');
                if a(i,i)~=0
                    a(i,i)=1./a(i,i);
                end
                end
end
                
for i =1:n
    for j=1:n
        if (i~=j);
            a(i,i)=a(i,i)+a(i,j);
            y(i,j)=-a(i,j);
        end
    end
    y(i,i)=a(i,i);
end
fprintf('\n\n The Y-BUS for the given data is :\n\n')
disp(y)