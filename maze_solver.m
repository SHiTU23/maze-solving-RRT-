clear
clc

map = generateEasyMap();
%%% map dimensions (570,500) : 570 to the right
fmap = figure;
imshow(map')
hold on

%%%% FOR FINDING THE COLLISION WITH MAZE WALLS, map(q_rand(1), q_rand(2))=0
%%%% MEANS IT HAS COLLISION

%%% start: x,y,point_id = 1
start = [5, 250, 1];
scatter(start(1), start(2), 'ko', 'markerfacecolor', 'Red');

target = [280,280];
scatter(target(1), target(2), 'ko', 'markerfacecolor', [0.6350 0.0780 0.1840]);

previous_point = start;
connected_points= [start, 0];
collision = 0;

%%%% GENERATE RANDOM POINT
rng(5,"twister");
random_range = 30;

point_id = 2;
rand_point = generate_randPoint(start, random_range, map);
q_rand = [rand_point, point_id];
scatter(q_rand(1), q_rand(2), 'b.', 'markerfacecolor', 'Blue');

%% generate new random points for all available points in connected_points list
for p = 1:size(connected_points,1)
    point_id = point_id+1;
    rand_point = generate_randPoint(connected_points(p,:), random_range, map);
    if map(rand_point(1), rand_point(2)) == 1
        scatter(rand_point(1), rand_point(2), 'b.', 'markerfacecolor', 'Blue');
        q_rand = vertcat(q_rand,[rand_point, point_id]);
    end
end

for q = 1: size(q_rand, 1)
    %% find the nearest point to the generated random point
    nearest_point = find_nearest(connected_points, q_rand(q,:))
end



 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%                FUNCTIONS                %%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function random_point = generate_randPoint(reference_point, range, map)
    map_border = 500;
    t = 2*pi*10*rand(1,1);
    r = range*sqrt(10*rand(1,1));
    x_rand_num = round(abs((reference_point(1)+20) + (10+r.*cos(t))))+1;
    y_rand_num = round(abs((reference_point(2)+20) + (10+r.*sin(t))))+1;
    if y_rand_num > map_border
        y_rand_num = map_border;
    elseif x_rand_num > map_border
        x_rand_num = map_border;
    elseif y_rand_num < 1
        y_rand_num = 1;
    elseif x_rand_num < 1
        y_rand_num = 1;
    end
    %%% collision
    while x_rand_num<0 || x_rand_num>map_border || y_rand_num<0 || y_rand_num>map_border || map(x_rand_num, y_rand_num)==0 
        t = 2*pi*10*rand(1,1);
        r = range*sqrt(10*rand(1,1));
        x_rand_num = round(abs((reference_point(1)+20) + (10+r.*cos(t)))) +1;
        y_rand_num = round(abs((reference_point(2)+20) + (10+r.*sin(t)))) +1;
    end
    if map(x_rand_num, y_rand_num)== 1  
        random_point = [x_rand_num, y_rand_num];
    end
end

function shortest_point = find_nearest(points_list, Point)
    shortest_path = 1000;
    nearest_point_index = 0;
    for i = 1:size(points_list,1)
        L1 = sqrt((points_list(i,1)-Point(1))^2 + (points_list(i,2)-Point(2))^2);
        if L1<shortest_path
            shortest_path = L1;
            nearest_point_index =i;
        end
    end
    shortest_point = points_list(nearest_point_index, :);
end