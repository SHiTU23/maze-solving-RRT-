# bug arena
 A arena in maltab for path planning algorithm comptition 

<br>


## RRT Algorithm for solving maze

There are two types of map that can be used:
+ **Easy map**: [script](generateEasyMap.m)
+ **more complicated map**: [script](generateMap.m)

<div style="display:flex">
    <div style="flex:1;padding-right:10px;">
        <img src="./pics/easy_map.png" width="200"/>
    </div>
    <div style="flex:1;padding-left:10px;">
        <img src="./pics/complex_map.png" width="200"/>
    </div>
</div>
<br>

In this Algorithm, start and target points are defined in the script. Searching for the path, starts from start point. and by generating random points around the start point, empty space will be found.
> The algorithm used for generating random points is **not** efficient, therefore, complex maps cannot be solved completely.

<br>