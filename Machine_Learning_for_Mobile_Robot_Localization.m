
clc; clear all; close all;
%% Functions used in this project:
% probability: gives a number from 0.01 to 1.0
% lidardata: Question #3 of HW #3

load("Data.mat") % I changed the data name

xdivide = linspace(-5.00001,5.00001,101);
ydivide = linspace(-5.00001,5.00001,101);
map = ones(100,100);


 
%creating map's binary matrix:
for i = 1:length(index)
   x = find(map_x(i) >= xdivide,1, 'last'); 
   y = find(map_y(i) >= ydivide,1,'last');
   map(x,y) = 0;
end
map = rot90(map);
%imshow(map)
hold on

% Defining initial position of the robot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
robotposition1 = [50,75]; %You can change the robot position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To show where we started later on, I store the first initial position:
initial(1,1) = robotposition1(1,1);
initial(1,2) = robotposition1(1,2);

% Initial belief:
for i=1:100
    for j=1:100
        belief(i,j) = 1/100/100;
    end
end



Newmap = map;
% In the following for loop, I change the Newmap matrix according the
% statements(comments) in the loop.
for i=2:100
    for j=2:100
        if Newmap(i,j) == 0 % if there is a wall
            wallProb = probability; % gives a probability
            if wallProb <= 0.40 % if prob = 0.4 
                Newmap(i,j) = 0; % Lidar sees the wall as it is supposed to see
            elseif (0.40 <= wallProb) && wallProb <= 0.475 % if prob = 0.075
                Newmap(i,j) = 1; % Lidar sees the wall a free space
                Newmap(i-1,j-1) = 0; % Lidar sees the wall adjacent to real wall
            elseif (0.475 <= wallProb) && wallProb <= 0.550 % if prob = 0.075
                Newmap(i,j) = 1;% Lidar sees the wall a free space% Lidar sees the wall a free space
                Newmap(i,j-1) = 0; % Lidar sees the wall adjacent to real wall
            elseif (0.550 <= wallProb) && wallProb <= 0.625 % if prob = 0.075
                Newmap(i,j) = 1; % Lidar sees the wall a free space
                Newmap(i+1,j-1) = 0; % Lidar sees the wall adjacent to real wall
            elseif (0.625 <= wallProb) && wallProb <= 0.700 % if prob = 0.075
                Newmap(i,j) = 1; % Lidar sees the wall a free space
                Newmap(i+1,j) = 0; % Lidar sees the wall adjacent to real wall
            elseif (0.700 <= wallProb) && wallProb <= 0.775 % if prob = 0.075
                Newmap(i,j) = 1; % Lidar sees the wall a free space
                Newmap(i+1,j+1) = 0; % Lidar sees the wall adjacent to real wall
            elseif (0.775 <= wallProb) && wallProb <= 0.850 % if prob = 0.075
                Newmap(i,j) = 1; % Lidar sees the wall a free space
                Newmap(i,j+1) = 0; % Lidar sees the wall adjacent to real wall
            elseif (0.850 <= wallProb) && wallProb <= 0.925 % if prob = 0.075
                Newmap(i,j) = 1; % Lidar sees the wall a free space
                Newmap(i-1,j+1) = 0; % Lidar sees the wall adjacent to real wall
            else % if prob = 0.075
                Newmap(i,j) = 1; % Lidar sees the wall a free space
                Newmap(i-1,j) = 0; % Lidar sees the wall adjacent to real wall
            end
        end
    end
end

for i=1:100
    for j=1:100
        % matrixForLidar is a new matrix that combines the real map and new
        % map that lidar sees the walls with probability 0.40.
        % This way, I create a new algorithm that the robot's belief and
        % real map combined so that the robot cannot go thorough the real
        % walls and it does not contradict with its belief.
        
        % If one of the matrices has 0 in one cell, then matrixForLidar has
        % 0 in the same cell:
       matrixForLidar(i,j) = Newmap(i,j)*map(i,j); 
    end
end



matrixForLidar_ = matrixForLidar'; 



fh = figure(1);
fh.WindowState = 'maximized';

% Plot on the right: This will give the positions of the robot for start of
% cycles
subplot(1,2,2)
    imshow(matrixForLidar) % Showing combined matrix 
    hold on
    
    %Grids:
    for j = 1:100 
        line([0.5,100.5], [0 + j+0.5,0 + j+0.5],"Color","k","Linewidth",0.5)
        hold on
        line([0 + j+0.5,0 + j+0.5],[0.5,100.5],"Color","k","Linewidth",0.5)
        hold on
    end
    scatter(robotposition1(1,1),robotposition1(1,2),30,"r","filled","s")
    
cyclesize = 10000; % The cycle size that robot will move. You can change it.
for i = 1:cyclesize
    
    %Within each cycle, I update the probabilities of the cells that the
    %robot might be inside:
    down1 = [robotposition1(1,1),robotposition1(1,2)+1];
    down2 = [robotposition1(1,1),robotposition1(1,2)+2];
    down3 = [robotposition1(1,1),robotposition1(1,2)+3];
    down4 = [robotposition1(1,1),robotposition1(1,2)+4];
    down5 = [robotposition1(1,1),robotposition1(1,2)+5];
    
    up1 = [robotposition1(1,1),robotposition1(1,2)-1];
    up2 = [robotposition1(1,1),robotposition1(1,2)-2];
    up3 = [robotposition1(1,1),robotposition1(1,2)-3];
    up4 = [robotposition1(1,1),robotposition1(1,2)-4];
    up5 = [robotposition1(1,1),robotposition1(1,2)-5];
    
    right1 = [robotposition1(1,1)+1,robotposition1(1,2)];
    right2 = [robotposition1(1,1)+2,robotposition1(1,2)];
    right3 = [robotposition1(1,1)+3,robotposition1(1,2)];
    right4 = [robotposition1(1,1)+4,robotposition1(1,2)];
    right5 = [robotposition1(1,1)+5,robotposition1(1,2)];
    
    left1 = [robotposition1(1,1)-1,robotposition1(1,2)];
    left2 = [robotposition1(1,1)-2,robotposition1(1,2)];
    left3 = [robotposition1(1,1)-3,robotposition1(1,2)];
    left4 = [robotposition1(1,1)-4,robotposition1(1,2)];
    left5 = [robotposition1(1,1)-5,robotposition1(1,2)];
    
    belief(down1(1,1),down1(1,2)) = belief(down1(1,1),down1(1,2)) + belief(down1(1,1),down1(1,2))*0.05;
    belief(down2(1,1),down2(1,2)) = belief(down2(1,1),down2(1,2)) + belief(down2(1,1),down2(1,2))*0.15;
    belief(down3(1,1),down3(1,2)) = belief(down3(1,1),down3(1,2)) + belief(down3(1,1),down3(1,2))*0.60;
    belief(down4(1,1),down4(1,2)) = belief(down4(1,1),down4(1,2)) + belief(down4(1,1),down4(1,2))*0.15;
    belief(down5(1,1),down5(1,2)) = belief(down5(1,1),down5(1,2)) + belief(down5(1,1),down5(1,2))*0.05;
    
    belief(up1(1,1),up1(1,2)) = belief(up1(1,1),up1(1,2)) + belief(up1(1,1),up1(1,2))*0.05;
    belief(up2(1,1),up2(1,2)) = belief(up2(1,1),up2(1,2)) + belief(up2(1,1),up2(1,2))*0.15;
    belief(up3(1,1),up3(1,2)) = belief(up3(1,1),up3(1,2)) + belief(up3(1,1),up3(1,2))*0.60;
    belief(up4(1,1),up4(1,2)) = belief(up4(1,1),up4(1,2)) + belief(up4(1,1),up4(1,2))*0.15;
    belief(up5(1,1),up5(1,2)) = belief(up5(1,1),up5(1,2)) + belief(up5(1,1),up5(1,2))*0.05;
    
    belief(right1(1,1),right1(1,2)) = belief(right1(1,1),right1(1,2)) + belief(right1(1,1),right1(1,2))*0.05;
    belief(right2(1,1),right2(1,2)) = belief(right2(1,1),right2(1,2)) + belief(right2(1,1),right2(1,2))*0.15;
    belief(right3(1,1),right3(1,2)) = belief(right3(1,1),right3(1,2)) + belief(right3(1,1),right3(1,2))*0.60;
    belief(right4(1,1),right4(1,2)) = belief(right4(1,1),right4(1,2)) + belief(right4(1,1),right4(1,2))*0.15;
    belief(right5(1,1),right5(1,2)) = belief(right5(1,1),right5(1,2)) + belief(right5(1,1),right5(1,2))*0.05;
    
    belief(left1(1,1),left1(1,2)) = belief(left1(1,1),left1(1,2)) + belief(left1(1,1),left1(1,2))*0.05;
    belief(left2(1,1),left2(1,2)) = belief(left2(1,1),left2(1,2)) + belief(left2(1,1),left2(1,2))*0.15;
    belief(left3(1,1),left3(1,2)) = belief(left3(1,1),left3(1,2)) + belief(left3(1,1),left3(1,2))*0.60;
    belief(left4(1,1),left4(1,2)) = belief(left4(1,1),left4(1,2)) + belief(left4(1,1),left4(1,2))*0.15;
    belief(left5(1,1),left5(1,2)) = belief(left5(1,1),left5(1,2)) + belief(left5(1,1),left5(1,2))*0.05;
    
    
    % Robot might know its position very close to 100% probability if we
    % apply a lot of cycles. If it is know its position, then there is no
    % need for further movement. The following loop does that.
    flag = 0;
    for k = 1:100
        for l = 1:100
            if belief(k,l) >= 1
                belief(k,l) = 1;
                flag = 1;                
                break
            end
        end
        if flag==1
            break
        end
    end
    
    % When robot knows where it is, a message is given about the situation:
    if flag==1
        cyclesize = i - 1;
        errordlg('Robot found its position with 100% probability at the cycle = '+string(cyclesize)+' There is no need for further movement','ROBOT FOUND WHERE IT IS');
        break
    end
                
    
    a = probability;
    if a <= 0.05 % Robot moves 1 cell with probability 0.05
        move = 1;
        cellprob = 0.05;
    elseif (0.05 < a)&& (a <= 0.20) % Robot moves 3 cell with probability 0.15
        move = 2;
        cellprob = 0.15;
    elseif (0.20 < a)&& (a <= 0.80) % Robot moves 3 cell with probability 0.60
        move = 3;
        cellprob = 0.60;
    elseif (0.80 < a)&& (a <= 0.95) % Robot moves 4 cell with probability 0.15
        move = 4;
        cellprob = 0.15;
    else % Robot moves 5 cell with probability 0.05
        move = 5;
        cellprob = 0.05;
    end

    % new probability defined to select the direction
    %(up,down,left or right with probabilities 0.25 for each):
    % up -->      b <= 0.25
    % down -->    0.25 < b <= 0.50
    % left -->    0.50 < b <= 0.75
    % right -->   0.75 < b <= 1.00
    
    % In the following if statements, I define a new algorithm which
    %prevents the robot to go that direction with some logic as well. 
    %Let's say robot will go up(b = 0.25) with 4 cells(0.80 < a <= 0.95)   
    %but there is a wall in the 3rd cell on the way, then the robot choose 
    %not to go that way because the robot actually was aware the wall
    %combination of up, down, left and right directions initially. It is
    %the best to not go to directions with walls in shorter distance than
    %the "move" command.
    b = probability; 
    dirprob = 0.25;
    if move == 1
        if matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+1) == 1 && b <= 0.25
            robotposition1(1,2) = robotposition1(1,2) + move;
        elseif matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-1)== 1 &&(0.25 < b)&& (b <= 0.50)
            robotposition1(1,2) = robotposition1(1,2) - move;
        elseif matrixForLidar_(robotposition1(1,1) + 1,robotposition1(1,2))== 1 &&(0.50 < b)&& (b <= 0.75)
            robotposition1(1,1) = robotposition1(1,1) + move;
        elseif matrixForLidar_(robotposition1(1,1)-1,robotposition1(1,2))== 1&&(0.75 < b)&& (b <= 1)
            robotposition1(1,1) = robotposition1(1,1) - move;
        end
    end
    
    
    if move == 2
        if matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+1)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+2)== 1 && b <= 0.25
            robotposition1(1,2) = robotposition1(1,2) + move;
        elseif matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-1)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-2)== 1 &&(0.25 < b)&& (b <= 0.50)
            robotposition1(1,2) = robotposition1(1,2) - move;
        elseif matrixForLidar_(robotposition1(1,1) + 1,robotposition1(1,2))== 1 && ...
                matrixForLidar_(robotposition1(1,1) + 2,robotposition1(1,2))== 1 &&(0.50 < b)&& (b <= 0.75)
            robotposition1(1,1) = robotposition1(1,1) + move;
        elseif matrixForLidar_(robotposition1(1,1)-1,robotposition1(1,2))== 1&& ...
                matrixForLidar_(robotposition1(1,1)-2,robotposition1(1,2))== 1&&(0.75 < b)&& (b < 1)
            robotposition1(1,1) = robotposition1(1,1) - move;
        end
    end
    
    if move == 3
        if matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+1)== 1 &&...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+2)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+3)== 1 && b <= 0.25
            robotposition1(1,2) = robotposition1(1,2) + move;
        elseif matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-1)== 1 &&...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-2)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-3)== 1 &&(0.25 < b)&& (b <= 0.50)
            robotposition1(1,2) = robotposition1(1,2) - move;
        elseif matrixForLidar_(robotposition1(1,1) + 1,robotposition1(1,2))== 1 &&...
                matrixForLidar_(robotposition1(1,1) + 2,robotposition1(1,2))== 1 && ...
                matrixForLidar_(robotposition1(1,1) + 3,robotposition1(1,2))== 1 &&(0.50 < b)&& (b <= 0.75)
            robotposition1(1,1) = robotposition1(1,1) + move;
        elseif matrixForLidar_(robotposition1(1,1)-1,robotposition1(1,2))== 1&&...
                matrixForLidar_(robotposition1(1,1)-2,robotposition1(1,2))== 1&& ...
                matrixForLidar_(robotposition1(1,1)-3,robotposition1(1,2))== 1&& (0.75 < b)&& (b < 1)
            robotposition1(1,1) = robotposition1(1,1) - move;
        end
    end
    
    
    
    if move == 4
        if matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+1)== 1 &&...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+2)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+3)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+4)== 1 && b <= 0.25
            robotposition1(1,2) = robotposition1(1,2) + move;
        elseif matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-1)== 1 &&...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-2)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-3)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-4)== 1 &&(0.25 < b)&& (b <= 0.50)
            robotposition1(1,2) = robotposition1(1,2) - move;
        elseif matrixForLidar_(robotposition1(1,1) + 1,robotposition1(1,2))== 1 &&...
                matrixForLidar_(robotposition1(1,1) + 2,robotposition1(1,2))== 1 && ...
                matrixForLidar_(robotposition1(1,1) + 3,robotposition1(1,2))== 1 && ...
                matrixForLidar_(robotposition1(1,1) + 4,robotposition1(1,2))== 1 &&(0.50 < b)&& (b <= 0.75)
            robotposition1(1,1) = robotposition1(1,1) + move;
        elseif matrixForLidar_(robotposition1(1,1)-1,robotposition1(1,2))== 1&&...
                matrixForLidar_(robotposition1(1,1)-2,robotposition1(1,2))== 1&& ...
                matrixForLidar_(robotposition1(1,1)-3,robotposition1(1,2))== 1&& ...
                matrixForLidar_(robotposition1(1,1)-4,robotposition1(1,2))== 1 &&(0.75 < b)&& (b < 1)
            robotposition1(1,1) = robotposition1(1,1) - move;
        end
    end
    
    
    
    
    if move == 5
        if matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+1)== 1 &&...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+2)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+3)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+4)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)+5)== 1 &&b <= 0.25
            robotposition1(1,2) = robotposition1(1,2) + move;
        elseif matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-1)== 1 &&...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-2)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-3)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-4)== 1 && ...
                matrixForLidar_(robotposition1(1,1),robotposition1(1,2)-5)== 1 &&(0.25 < b)&& (b <= 0.50)
            robotposition1(1,2) = robotposition1(1,2) - move;
        elseif matrixForLidar_(robotposition1(1,1) + 1,robotposition1(1,2))== 1 &&...
                matrixForLidar_(robotposition1(1,1) + 2,robotposition1(1,2))== 1 && ...
                matrixForLidar_(robotposition1(1,1) + 3,robotposition1(1,2))== 1 && ...
                matrixForLidar_(robotposition1(1,1) + 4,robotposition1(1,2))== 1 && ...
                matrixForLidar_(robotposition1(1,1) + 5,robotposition1(1,2))== 1 &&(0.50 < b)&& (b <= 0.75)
            robotposition1(1,1) = robotposition1(1,1) + move;
        elseif matrixForLidar_(robotposition1(1,1)-1,robotposition1(1,2))== 1&&...
                matrixForLidar_(robotposition1(1,1)-2,robotposition1(1,2))== 1&& ...
                matrixForLidar_(robotposition1(1,1)-3,robotposition1(1,2))== 1&& ...
                matrixForLidar_(robotposition1(1,1)-4,robotposition1(1,2))== 1 && ...
                matrixForLidar_(robotposition1(1,1)-5,robotposition1(1,2))== 1 &&(0.75 < b)&& (b < 1)
            robotposition1(1,1) = robotposition1(1,1) - move;
        end
    end
    % I create positionarray object to let you run lidardata for any cycle.
    positionarray(i,1) = robotposition1(1,1); 
    positionarray(i,2) = robotposition1(1,2);
    % For example, if you run the following:
    
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%     fh = figure();
%     fh.WindowState = 'maximized';
%     subplot(11,10,1:100)
%     imshow(matrixForLidar) % Showing combined matrix 
%     hold on
% 
%     for i = 1:100 
%         line([0.5,100.5], [0 + i+0.5,0 + i+0.5],"Color","k","Linewidth",0.5)
%         hold on
%         line([0 + i+0.5,0 + i+0.5],[0.5,100.5],"Color","k","Linewidth",0.5)
%         hold on
%     end
%     cycleNumber = 3;  %You should change the cycleNumber to see lidar data of different cycles 
%     title("Lidar Result at the cycle "+string(cycleNumber))
%     lidardata([positionarray(cycleNumber,1),positionarray(cycleNumber,2)],matrixForLidar);
%     hold on

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%it will give 3rd cycle's robot lidar demonstration. You can run this
    %%section by uncommenting,copying and pasting on the command window 
    %%after the whole code is executed. (I provided the lidardata function 
    %%on a seperate file as well to allow you to call it if you run this 
    %%section.)
    
    %%

    
    
    % Plot on the left: This will show you how the probability distribution
    % changes within the map. 
    subplot(1,2,1)
    imagesc(belief')
    axis image
    colorbar
    title("Probability distrubition when the cycle is "+string(i))
    hold off
    
    
    %Updating the plot on the right for each movement.
    subplot(1,2,2) 

    scatter(robotposition1(1,1),robotposition1(1,2),30,"r","filled","s")
    title("Positions robot has been at until the cycle "+string(i))
            
    pause(0.01)
    
    %Robot may try to go out of the map and that will clearly create an
    %error. If the robot tries to go beyond the map, then a related message
    %is given.
    if move + robotposition1(1,1)>=100 || robotposition1(1,1) - move<= 1 || move + robotposition1(1,2)>=100 || robotposition1(1,2) - move<= 1
        errordlg('Your robot tried to escape the map at the cycle = '+string(i)+'. It might be a betrayel. Please run the code again. ...OR please decrease the cyclesize','YOUR ROBOT HAS BETRAYED YOU');
        return
    end
    
    
end

%This figure will show the final position of the robot and the lidar data
%of it(what it can see) according to the conditions and wall probabilities
%in the homework. (matrixForLidar already does the probability job.)
fh = figure(2);
fh.WindowState = 'maximized';
subplot(11,10,1:100)
imshow(matrixForLidar) % Showing combined matrix 
hold on

%Grids
for i = 1:100 
    line([0.5,100.5], [0 + i+0.5,0 + i+0.5],"Color","k","Linewidth",0.5)
    hold on
    line([0 + i+0.5,0 + i+0.5],[0.5,100.5],"Color","k","Linewidth",0.5)
    hold on
end
title("Final Position of the robot at the end of "+string(cyclesize)+" cycles (Green is the initial position / Red is the final position)")
lidardata(robotposition1,matrixForLidar); 
hold on
scatter(initial(1),initial(2),30,"g",'filled','s') 




% lidardata function discussed at the very beginning of the code:
%This function is actually created for Q3 of HW3. 
% For the discrete map for the data of HW3, it takes in the robot position 
%and the map, and outputs (and plots) the lidar data expected as if there 
%is a lidar on the robot. The maximum range that the lidar can see is 10 
%cells. The lidar is not able to see anything beyond an obstacle, if there 
%is an obstacle at a distance less than this maximum range.
function lidardata(robotposition,map) 

trans = map';

if trans(robotposition(1),robotposition(2)) == 1
for i=1:10
    if trans(robotposition(1)+i,robotposition(2)) == 1
        scatter(robotposition(1)+i,robotposition(2),30,"b",'filled','s','MarkerFaceAlpha',.5)
    else
        break
    end
    
end
for i=1:10
        if trans(robotposition(1)-i,robotposition(2)) == 1
        scatter(robotposition(1)-i,robotposition(2),30,"b",'filled','s','MarkerFaceAlpha',.5)
    else
        break
    end
end
end

if trans(robotposition(1),robotposition(2)) == 1
for i=1:9
    if trans(robotposition(1),robotposition(2)+1) == 1
        scatter(robotposition(1),robotposition(2)+1,30,"b",'filled','s','MarkerFaceAlpha',.5)
        if trans(robotposition(1)+i,robotposition(2)+1) == 1
            scatter(robotposition(1)+i,robotposition(2)+1,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

for i=1:9
    if trans(robotposition(1)-i,robotposition(2)+1) == 1
        scatter(robotposition(1)-i,robotposition(2)+1,30,"b",'filled','s','MarkerFaceAlpha',.5)
    else
        break
    end
end
end


if trans(robotposition(1),robotposition(2)) == 1
for i=1:9
    if trans(robotposition(1),robotposition(2)-1) == 1
        scatter(robotposition(1),robotposition(2)-1,30,"b",'filled','s','MarkerFaceAlpha',.5)
        if trans(robotposition(1)+i,robotposition(2)-1) == 1
            scatter(robotposition(1)+i,robotposition(2)-1,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

for i=1:9
    if trans(robotposition(1)-i,robotposition(2)-1) == 1
        scatter(robotposition(1)-i,robotposition(2)-1,30,"b",'filled','s','MarkerFaceAlpha',.5)
    else
        break
    end
end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)+2) == 1
            scatter(robotposition(1),robotposition(2)+2,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+2) == 1
                scatter(robotposition(1)+i,robotposition(2)+2,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)+2) == 1
            scatter(robotposition(1)-i,robotposition(2)+2,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)-2) == 1
            scatter(robotposition(1),robotposition(2)-2,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-2) == 1
                scatter(robotposition(1)+i,robotposition(2)-2,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)-2) == 1
            scatter(robotposition(1)-i,robotposition(2)-2,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)+3) == 1
            scatter(robotposition(1),robotposition(2)+3,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+3) == 1
                scatter(robotposition(1)+i,robotposition(2)+3,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)+3) == 1
            scatter(robotposition(1)-i,robotposition(2)+3,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)-3) == 1
            scatter(robotposition(1),robotposition(2)-3,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-3) == 1
                scatter(robotposition(1)+i,robotposition(2)-3,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)-3) == 1
            scatter(robotposition(1)-i,robotposition(2)-3,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)+4) == 1
            scatter(robotposition(1),robotposition(2)+4,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+4) == 1
                scatter(robotposition(1)+i,robotposition(2)+4,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)+4) == 1
            scatter(robotposition(1)-i,robotposition(2)+4,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)-4) == 1
            scatter(robotposition(1),robotposition(2)-4,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-4) == 1
                scatter(robotposition(1)+i,robotposition(2)-4,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)-4) == 1
            scatter(robotposition(1)-i,robotposition(2)-4,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1
    for i=1:8
        if trans(robotposition(1),robotposition(2)+5) == 1
            scatter(robotposition(1),robotposition(2)+5,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+5) == 1
                scatter(robotposition(1)+i,robotposition(2)+5,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:8
        if trans(robotposition(1)-i,robotposition(2)+5) == 1
            scatter(robotposition(1)-i,robotposition(2)+5,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1
    for i=1:8
        if trans(robotposition(1),robotposition(2)-5) == 1
            scatter(robotposition(1),robotposition(2)-5,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-5) == 1
                scatter(robotposition(1)+i,robotposition(2)-5,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:8
        if trans(robotposition(1)-i,robotposition(2)-5) == 1
            scatter(robotposition(1)-i,robotposition(2)-5,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1 && trans(robotposition(1),robotposition(2)+5)==1 
    for i=1:8
        if trans(robotposition(1),robotposition(2)+6) == 1
            scatter(robotposition(1),robotposition(2)+6,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+6) == 1
                scatter(robotposition(1)+i,robotposition(2)+6,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:8
        if trans(robotposition(1)-i,robotposition(2)+6) == 1
            scatter(robotposition(1)-i,robotposition(2)+6,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1 && trans(robotposition(1),robotposition(2)-5)==1
    for i=1:8
        if trans(robotposition(1),robotposition(2)-6) == 1
            scatter(robotposition(1),robotposition(2)-6,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-6) == 1
                scatter(robotposition(1)+i,robotposition(2)-6,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:8
        if trans(robotposition(1)-i,robotposition(2)-6) == 1
            scatter(robotposition(1)-i,robotposition(2)-6,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1 && trans(robotposition(1),robotposition(2)+5)==1 && ...
        trans(robotposition(1),robotposition(2)+6)==1 
    for i=1:7
        if trans(robotposition(1),robotposition(2)+7) == 1
            scatter(robotposition(1),robotposition(2)+7,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+7) == 1
                scatter(robotposition(1)+i,robotposition(2)+7,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:7
        if trans(robotposition(1)-i,robotposition(2)+7) == 1
            scatter(robotposition(1)-i,robotposition(2)+7,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1 && trans(robotposition(1),robotposition(2)-5)==1 && ...
        trans(robotposition(1),robotposition(2)-6)==1
    for i=1:7
        if trans(robotposition(1),robotposition(2)-7) == 1
            scatter(robotposition(1),robotposition(2)-7,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-7) == 1
                scatter(robotposition(1)+i,robotposition(2)-7,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:7
        if trans(robotposition(1)-i,robotposition(2)-7) == 1
            scatter(robotposition(1)-i,robotposition(2)-7,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1 && trans(robotposition(1),robotposition(2)+5)==1 && ...
        trans(robotposition(1),robotposition(2)+6)==1 && trans(robotposition(1),robotposition(2)+7)==1 
    for i=1:6
        if trans(robotposition(1),robotposition(2)+8) == 1
            scatter(robotposition(1),robotposition(2)+8,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+8) == 1
                scatter(robotposition(1)+i,robotposition(2)+8,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:6
        if trans(robotposition(1)-i,robotposition(2)+8) == 1
            scatter(robotposition(1)-i,robotposition(2)+8,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1 && trans(robotposition(1),robotposition(2)-5)==1 && ...
        trans(robotposition(1),robotposition(2)-6)==1 && trans(robotposition(1),robotposition(2)-7)==1 
    for i=1:6
        if trans(robotposition(1),robotposition(2)-8) == 1
            scatter(robotposition(1),robotposition(2)-8,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-8) == 1
                scatter(robotposition(1)+i,robotposition(2)-8,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:6
        if trans(robotposition(1)-i,robotposition(2)-8) == 1
            scatter(robotposition(1)-i,robotposition(2)-8,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1 && trans(robotposition(1),robotposition(2)+5)==1 && ...
        trans(robotposition(1),robotposition(2)+6)==1 && trans(robotposition(1),robotposition(2)+7)==1 && ...
        trans(robotposition(1),robotposition(2)+8)==1  
    for i=1:4
        if trans(robotposition(1),robotposition(2)+9) == 1
            scatter(robotposition(1),robotposition(2)+9,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+9) == 1
                scatter(robotposition(1)+i,robotposition(2)+9,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:4
        if trans(robotposition(1)-i,robotposition(2)+9) == 1
            scatter(robotposition(1)-i,robotposition(2)+9,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1 && trans(robotposition(1),robotposition(2)-5)==1 && ...
        trans(robotposition(1),robotposition(2)-6)==1 && trans(robotposition(1),robotposition(2)-7)==1 && ...
        trans(robotposition(1),robotposition(2)-8)==1 
    for i=1:4
        if trans(robotposition(1),robotposition(2)-9) == 1
            scatter(robotposition(1),robotposition(2)-9,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-9) == 1
                scatter(robotposition(1)+i,robotposition(2)-9,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:4
        if trans(robotposition(1)-i,robotposition(2)-9) == 1
            scatter(robotposition(1)-i,robotposition(2)-9,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1 && trans(robotposition(1),robotposition(2)+5)==1 && ...
        trans(robotposition(1),robotposition(2)+6)==1 && trans(robotposition(1),robotposition(2)+7)==1 && ...
        trans(robotposition(1),robotposition(2)+8)==1 &&  trans(robotposition(1),robotposition(2)+9)==1 && ...
        trans(robotposition(1),robotposition(2)+10)==1
    scatter(robotposition(1),robotposition(2)+10,30,"b",'filled','s','MarkerFaceAlpha',.5)
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1 && trans(robotposition(1),robotposition(2)-5)==1 && ...
        trans(robotposition(1),robotposition(2)-6)==1 && trans(robotposition(1),robotposition(2)-7)==1 && ...
        trans(robotposition(1),robotposition(2)-8)==1 &&  trans(robotposition(1),robotposition(2)-9)==1 && ...
        trans(robotposition(1),robotposition(2)-10)==1
    scatter(robotposition(1),robotposition(2)-10,30,"b",'filled','s','MarkerFaceAlpha',.5)
end

scatter(robotposition(1),robotposition(2),30,"r",'filled','s','MarkerFaceAlpha',.5)


end

% probability function discussed at the very begginning of the code
function prob = probability()
    interval = [1:100];
    idx=randperm(length(interval),1);
    prob = idx/100;
end
