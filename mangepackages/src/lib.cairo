
// Packages: A Scarb feature that lets you build, test, and share crates.
// Crates: A tree of modules that corresponds to a single compilation unit. 
//It has a root directory, and a root module defined at the lib.cairo file under this directory.
// Modules and use: Let you control the organization and scope of items.
// Paths: A way of naming an item, such as a struct, function, or module.

pub mod garden;
use crate::garden::vegetables::Asparagus;

mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}

        fn seat_at_table() {}
    }

    mod serving {
        fn take_order() {}

        fn serve_order() {}

        fn take_payment() {}
    }
}

pub fn eat_at_restaurant() {
    // Absolute path
    crate::front_of_house::hosting::add_to_waitlist();

    // Relative path
    front_of_house::hosting::add_to_waitlist();
}


fn main() {
    let plant = Asparagus{};
    println!("I'm growing {:?}!", plant);
}