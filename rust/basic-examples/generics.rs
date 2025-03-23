
/// returns the squared value of a number
fn squared<T: std::ops::Mul<Output = T> + Copy>(v:T) -> T {
    return v * v;
}

fn main(){
    let a = 3.0;
    println!("a = {}",a);
    println!("squared(a) = {}",squared(a));

    let b = 5;
    println!("b = {}",b);
    println!("squared(b) = {}",squared(b));

    let items = [1.0,2.0,3.0,4.0];
    println!("items = {:?}",items);
    println!("squared(items) = {:?}",items.map(squared));
    println!("squared(items)'s sum = {:?}",items.map(squared).iter().sum::<f64>());
}
