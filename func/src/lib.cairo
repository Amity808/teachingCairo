fn main() {
    another_fun();
        

    passingParameter(5, "Bolarinwa");
    let first_arg = 3;
    let second_arg = "lorem ipsum";
    passingParameter(first_arg, second_arg);

    let x = 5;
    let y = "Bolarinwa";
    passingParameter(x, y);

    // bounding value 
    let yx = {
        let x = 3;
        x + 1
    };

    println!("bounding value of yx is {}", yx);

    let w = five();
    println!("The value of w is {}", w);
}


fn another_fun() {
    println!("Another");
}

fn passingParameter(x: felt252, label: ByteArray) {
    println!("The value of x is {}, label = {}", x, label);
}

// function returning value 

fn five() -> u32 {
    5
}

// #[cfg(test)]
// mod tests {
//     use super::fib;

//     #[test]
//     fn it_works() {
//         assert(fib(16) == 987, 'it works!');
//     }
// }
