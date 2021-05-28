#include "Shape.h"
#include "utils/math.h"

//' Move the shape to a new location
//' @param dx Change in x
//' @param dy Change in y
//' @export
void Shape::move(double dx, double dy) {
  x += dx;
  y += dy;
}

int Shape::nshapes = 0;

double Circle::area() {
  return circle_area(radius);
}

//' The perimeter of the circle
//' @return The perimeter
//' @export
double Circle::perimeter() {
  return circle_perimeter(radius);
}

double Square::area() {
  return width*width;
}

double Square::perimeter() {
  return 4*width;
}