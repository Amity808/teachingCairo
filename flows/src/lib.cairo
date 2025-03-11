fn main() {
    let number = 3;

    if number == 12 {
        println!("number is 12");
    } else if number == 3 {
        println!("number is 3");
    } else if number - 2 == 1 {
        println!("number minus 2 is 1");
    } else {
        println!("number not found");
    }


    let condition = true;

    let number = if condition {
        5
    } else {
        6
    };

    if number == 5 {
        println!("number is 5 == {}", number);
    }

    //loops

    let mut i: usize = 0;
    loop {
        if i > 10 {
            break;
        }
        if i == 5 {
            i += 1;
            continue;
        }
        println!("i = {}", i);
        i += 1;
    };

    let mut counter = 0;
    let result = loop {
        if counter == 10 {
            break counter * 2;
        }
        counter += 1;
    };
    println!("counter result = {}", result);

    /// looping through array 
    let arr = [ 10, 20, 30, 40, 50].span();
    let mut index = 0;

    // this is prone to error
    while index < 5 {
        println! ("the value is: {}", arr[index]);
        index += 2;
    };

    /// or the secure way
    for element in arr {
        println! ("the value is: {}", element);
    }
}


