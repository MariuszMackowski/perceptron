function [wages,error] = myPerceptron(input,output)
[r,c] = size(input);
wages = rand(1,c+1); %random wages
error = 1;
ni = 0.1; %learning rate 
while error>0
    error = 0;
    order = randperm(r,r); %randomize order
    
    for sample = 1:length(order)
        %calc value for every sample
        fv = wages(1) + input(order(sample),1)*wages(2) + input(order(sample),2)*wages(3);
        %activation function
        if fv>0
            f = 1;
        else
            f = 0;
        end
        %calc error
        delta = output(order(sample)) - f;
      
        if delta ~= 0
            error = error + 1;
            %update wages
            wages(1) = wages(1) + ni * delta;
            wages(2) = wages(2) + ni * delta * input(order(sample),1);
            wages(3) = wages(3) + ni * delta * input(order(sample),2);

        end
    end

end

%plot results
figure(1)
hold on
for i=1:length(output)
    if output(i)>0
        plot(input(i,1),input(i,2),'xr')
    else
        plot(input(i,1),input(i,2),'bo')
    end
end
x = min(input):0.1:max(input);
y = (-1/wages(3)) *(wages(1)+wages(2)*x);
plot(x,y)
end