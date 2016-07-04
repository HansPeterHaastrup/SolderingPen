$fn=50;

//Soldering station stand
//Uncomment the different modules at the bottom of the file to export the parts

module base() 
{
    difference() 
    {
        union()
        {
            minkowski() 
            {
                cube([50,100,3]);
                cylinder(r=5,h=1);
            }
            hull() 
            {
                translate([50,95,0]) cube([5,5,4]);
                translate([50,85,0]) cube([5,10,15]);
                translate([50,60,0]) cube([5,10,4]);
            }
        }
        //mounting holes
        translate([-10,90,10]) rotate([0,90,0]) cylinder(r=3.2/2,h=70);
        // trim excess material in the middle
        translate([5,10,0]) minkowski() 
        {
            cube([35,80,3]);
            cylinder(r=5,h=1);
        }
    }
}

module sidebar() 
{
    difference() 
    {
        b=50;
        //outline
        hull () 
        {
            rotate([0,0,0]) translate([-5,-31,0]) cube([20,11,4]);
            translate([b,5,0]) cylinder(r=5,h=4);
            translate([b-12.5,17.5,0]) cylinder(r=5,h=4);
        }
        //trim away excess material
        hull () 
        {
            translate([10,-20,0]) cylinder(r=5,h=4);
            translate([40,2,0]) cylinder(r=5,h=4);
            translate([35,8,0]) cylinder(r=5,h=4);
        }
        //mounting hole
        translate([0,-25,0]) cylinder(r=3.1/2,h=70);
        translate([b,5,0]) cylinder(r=3.1/2,h=70);
        translate([b-12.5,17.5,0]) cylinder(r=3.1/2,h=70);   
    }
}

module top()
{
    difference()
    {
        //outline
        hull () 
        {
            translate([0,0,5]) rotate([0,90,0]) cylinder(r=5,h=40);
            translate([0,25,5]) rotate([0,90,0]) cylinder(r=5,h=40);
        }       
        //mounting holes
        translate([0,0,5]) rotate([0,90,0]) cylinder(r=3.1/2,h=40);
        translate([0,25,5]) rotate([0,90,0]) cylinder(r=3.1/2,h=40);
        //wedge for easier insert
        translate([20,15,0]) cylinder(r1=2,r2=11/2,h=10);        
        //the wedge-hole for the pen insert
        hull()
        {
            translate([20,15,0]) cylinder(r=2,h=10);        
            translate([30,35,0]) cylinder(r=2,h=10);        
            translate([10,35,0]) cylinder(r=2,h=10);        
        }
        //hole for supporter
        translate([17.5,2,0]) cube([5,3,10]);
    }
}

module supporter() 
{
    translate([2.5,0,0]) cylinder(r=5,h=3);
    hull() 
    {
        cube([5,65,3]);
        translate([1,65,0]) cube([3,5,2]);
    }
}

//supporter();
//base();
//sidebar();
top();