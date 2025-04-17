use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    println!("{:?}", args);
    println!("args.len() = {}",args.len());
    for i in 0..args.len() {
        println!("args[{}] = {}",i,args[i]);
    }
}

