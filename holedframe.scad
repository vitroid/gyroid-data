thick=0.05;
$fn=40;
R=sqrt(2)/2;

module panelA(){
    translate([-1,0,0]){
        difference(){
            cube([1,1,thick]);
            translate([-0.6, 0.5, 0]){
                scale([1.2, 1, 1])
                    cylinder(h=thick, r=R);
            }
        }
    }
}


module panelB(){
    translate([0,0,1])
    rotate([0,180,0]){
    intersection(){
        cube([1,1,1]);
        translate([-0.6, 0.5, 0]){
            scale([1.2, 1, 1])
            cylinder(h=1, r1=R, r2=0);
        }
    }
}
}


module holesA(){
    for(i=[-33:6:33])
        translate([R*1.05*1.2*cos(i)-1.6,R*1.05*sin(i)+0.5,0])
            cylinder(h=0.3, r=thick/2, center=true);
}


module holesB(){
    for(i=[-33:6:33])
        translate([-R*0.95*1.2*cos(i)+0.6,R*0.95*sin(i)+0.5,1])
            cylinder(h=1, r=thick/2, center=true);
}


module holes(){
    holesA();
    holesB();
}


module panels(){
    panelA();
    panelB();
}

module panel6(){
    panels();
    rotate([0,90,90])
    panels();
    rotate([0,90,90])
    rotate([0,90,90])
    panels();
}

module hole6(){
    holes();
    rotate([0,90,90])
    holes();
    rotate([0,90,90])
    rotate([0,90,90])
    holes();
}


scale(60){
    difference(){
        panel6();
        hole6();
    }
}