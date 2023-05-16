thick=0.05;
$fn=40;
R=sqrt(2)/2;

module panelA(){
    translate([-1,0,0]){
        difference(){
            cube([1,1,thick]);
            translate([-0.5, 0.5, 0]){
                cylinder(h=thick, r=R);
            }
        }
        intersection(){
            translate([-0.5, 0.5, 0])
                pins();
            cube([1,1,thick]);
        }
    }
}


module panelB(){
    translate([0,0,1])
    rotate([0,180,0]){
    intersection(){
        cube([1,1,1]);
        translate([-0.5, 0.5, 0]){
            cylinder(h=1, r1=R, r2=0);
            pins();
        }
    }
}
}


module pins(){
    for(i=[-33:9:39])
        rotate([0,0,i])
            translate([R,0,0])
                scale([thick*2,
                       thick/2,
                       thick])
                    sphere(1);
}


module panels(){
    panelA();
    panelB();
}


scale(60){
panels();
rotate([0,90,90])
panels();
rotate([0,90,90])
rotate([0,90,90])
panels();
}