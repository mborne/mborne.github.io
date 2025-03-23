use std::env;
use std::{thread, time::Duration};

fn countdown(n: i32){
    let mut current: i32 = n;
    while current > 0 {
        println!("{}", current);
        current = current-1;
        thread::sleep(Duration::from_millis(500));
    }
    println!("Boooommmm!!!");
}

fn main(){
    let args: Vec<String> = env::args().collect();
    let n = if args.len() < 2 { 5 } else { args[1].parse().expect("Not a number!") };
    countdown(n);
}
