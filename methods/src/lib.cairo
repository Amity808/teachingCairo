// Methods are similar to functions: we declare them with the fn keyword 
//and a name, they can have parameters and a return value, and 
//they contain some code that’s run when the method is called from somewhere else.
// Unlike functions, methods are defined within the context of a struct (or an enum


#[derive(Copy, Drop)]
struct Rectangle {
    width: u64,
    height: u64,
}

#[derive(Copy, Drop)]
struct Square {
    width: u64,
    height: u64,
}

// this are link interfaces in solidity
// trait RectangleTrait {
//     fn area(self: @Rectangle) -> u64;
// }

//implementing methods
// impl blocks can only be defined for traits and not types, 
//we need to define this trait first - 
//but it's not meant to be used for anything else.
#[generate_trait]
impl RectangleImpl of RectangleTrait {
    fn area(self: @Rectangle) -> u64 {
        // before we can use the snapshot we have to despan it since we are not taking ownership
        (*self.width) * (*self.height)
    }
    fn scale(ref self: Rectangle, factor: u64) {
        self.width *= factor;
        self.height *= factor;
    }

    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool {
        *self.width > *other.width && *self.height > *other.height
    }
}

//defining a trait and then implementing it to define methods on a specific type is verbose,
// and unnecessary: the trait itself will not be reused.
//So, to avoid defining useless traits, 
//Cairo provides the #[generate_trait] attribute to add above a trait implementation, 
//which tells the compiler to generate the corresponding trait definition for you,
//for instance 
#[generate_trait]
impl SquareImpl of SquareTrait {
    fn area(self: @Square) -> u64 {
        // before we can use the snapshot we have to despan it since we are not taking ownership
        (*self.width) * (*self.height)
    }
}

fn main() {
    let rect1 = Rectangle{ width: 5, height: 5 };
    // we want to call the area method we declare which was inherited from trait
    println!("area of {}", rect1.area());

    let sqaure1 = Square{ width: 5, height: 5 };
    // we want to call the area method we declare which was inherited from trait
    println!("area from sqaure struct {}", sqaure1.area());

    let mut rect2 = Rectangle{ width: 5, height: 5 };
    rect2.scale(2);
    println!("the new size is (width:{}, height: {})", rect2.width, rect2.height);

    let rect12 = Rectangle { width: 30, height: 50 };
    let rect23 = Rectangle { width: 10, height: 40 };
    let rect34 = Rectangle { width: 60, height: 45 };

    println!("Can rect1 hold rect2? {}", rect1.can_hold(@rect23));
    println!("Can rect1 hold rect3? {}", rect1.can_hold(@rect34));

}