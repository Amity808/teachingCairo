
//custom data type that consists of a fixed set of named values, 
//called variants. Enums are useful for representing a collection 
//of related values where each value is distinct and has a specific meaning.
// to define enum 
#[derive(Drop)]
enum DirectionNo_Value {
    North,
    South,
    West,
    East,
}
// with value

#[derive(Drop)]
enum Direction {
    North: u128,
    South: u128,
    West: u128,
    East: u128,
}

// enum can also be used to sort multiple data types 
#[derive(Drop)]
enum Message{
    Quit,
    Echo: felt252,
    Move: (u128, u128),
}


#[generate_trait]
impl ProccesingImpl of Proccesing {
    fn process(self: Message) {
        match self {
            Message::Quit => { println!("Quiting") },
            Message::Echo(value) => { println!("Echoing {}", value) },
            Message::Move((x, y)) => { println!("Moveing {} {}", x, y) },
        }
    }
}

// The Option enum is a standard Cairo enum that represents 
//the concept of an optional value. 
//It has two variants: Some: T and None. 
//Some: T indicates that there's a value of type T, 
//while None represents the absence of a value.
// it helps to prevent bugs 
#[derive(Drop)]
enum Option<T> {
    Some: T,
    None,
}

//match has two arm, the pattern and the code Coin::Penny => 1,
// If you want to run multiple lines of code in a match arm, 
//you must use curly brackets, with a comma following the arm.
// Coin::Penny => {
//     println!("Lucky penny!");
//     1
// },

//matching with option<T>
fn plus_one(x: Option<u8>) -> Option<u8> {
    match x {
        Option::Some(val) => Option::Some(val + 1),
        Option::None => Option::None,
    }
}
fn main() {
    // let direction = Direction::North;
    let direction = Direction::North(12);

    // to implement 
    let msg: Message = Message::Quit;
    msg.process(); // printing Quiting

    let five: Option<u8> = Option::Some(5);
    let six : Option<u8> = plus_one(five);
    let none = plus_one(Option::None);
}