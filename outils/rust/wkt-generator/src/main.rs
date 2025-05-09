use std::env;
use rand::prelude::*;

fn main() {
    let n : i64 = env::args().nth(1).unwrap_or("10".to_string()).parse().unwrap();

    let mut rng = rand::rng();
    // random points in [0.0,1.0] x [0.0,1.0]
    let mut values: Vec<(f64,f64)> = (1..n).map( |_| (
        rng.random(),
        rng.random()
    )).collect();

    // random values in degrees
    for v in values.iter_mut() {
        v.0 = 360.0 * v.0 - 180.0;
        v.1 = 2.0 * ( v.1 - 0.5 ) * 85.051129;
    }
    // format to CSV with WKT geometries
    println!("ID,WKT");
    let mut id = 0;
    for v in values.iter() {
        id += 1;
        println!("{},\"POINT({:.6} {:.6})\"",id,v.0,v.1);
    }
}
