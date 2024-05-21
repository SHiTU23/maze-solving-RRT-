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