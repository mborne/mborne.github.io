fn main(){
    let integers = [1; 5];
    println!("integers={:?}",integers);
    // see https://doc.rust-lang.org/std/iter/trait.Sum.html
    let sum:i64 = integers.iter().sum();
    println!("sum(integers)={}",sum);

    let floats = [1.0,2.0,3.0,4.0];
    println!("floats={:?}",floats);
    let mean_floats: f64 = floats.map(f64::from).iter().sum::<f64>() / ( floats.len() as f64);
    println!("average(floats)={}",mean_floats);

    let brands = ["Toyota","Porche","Peugeot"];
    println!("{:?}",brands);
}

