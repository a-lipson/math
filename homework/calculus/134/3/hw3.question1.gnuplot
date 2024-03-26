set table "hw3.question1.table"; set format "%.5f"
 f(x,y) = x**2 + x*y + 2*y**2 - 1; set xrange [-4:4]; set yrange [-4:4]; set view 0,0; set isosample 1000, 1000; set size square; set contour base; set cntrparam levels incre 0,0.1,0; unset surface; splot f(x,y); 
