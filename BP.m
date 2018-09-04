Rawdata = xlsread('BP.xlsx', 1, 'B2:B17064'); %Load the data in the excel file
disp('Reading Data');

subplot(2,1,1); %Plot the rawdata for comparison
plot(Rawdata);
title ('Rawdata');
xlabel('time');
ylabel('BP (HHmg)');
disp('Data read and Rawdata plotted');

filtered = Rawdata - sgolayfilt(Rawdata,5,1301);            

subplot(2,1,2);       %Plot the filtered signal
plot(filtered);


max = 0;      %Find out where the maximal oscillation occurs
prior = 0;    %and use the index to find out the corresponding pressure
index = 1;
for i = 1:length(Rawdata)
    temp = filtered(i);
    if(temp>max && abs(prior-temp)<0.5)
        max = temp;
        index = i;
    end
    prior = temp;
end

X = ['Calculated MAP is (mmHg): ', num2str(Rawdata(index))];  %Print out the values with the assumed ratios
disp (X);
disp ('Assuming systolic ratio = 0.75 and diastolic ratio = 0.7');
A = ['Estimated SP: ', num2str(Rawdata(index)/0.75)];
B = ['Estimated DP: ', num2str(Rawdata(index)*0.7)];
disp (A);
disp (B);
Y = ['Index is:', num2str(index)];
disp (Y);
