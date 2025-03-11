#[derive(Drop)]
struct User {
    active: bool,
    username: ByteArray,
    email: ByteArray,
    sign_in_count: u64,
}

#[derive(Drop, PartialEq)]
struct Rectangle {
    width: u64,
    height: u64,
}
#[derive(Drop)]
struct Square {
    side_length: u64,
}

impl SquareIntoRectangle of Into<Square, Rectangle> {
    fn into(self: Square) -> Rectangle {
        Rectangle { width: self.side_length, height: self.side_length}
    }
}



fn main() {
    let _user1 = User {
        active: true, username: "someusername123", email: "someone@example.com", sign_in_count: 1,
    };
    let _user2 = User {
        sign_in_count: 1, username: "someusername123", active: true, email: "someone@example.com",
    };

    // let _use3 = User { username: "someusername123", email: "someone@example.com", .._user2};
    // let rec = Rectangle { width: 5, height: 5};
    // let result = areaRec(rec);

    // println!("result: {}", result);

    let sqaure = Square { side_length: 5 };
    let result: Rectangle = sqaure.into();
    let expected = Rectangle { width: 5, height: 5};

    assert!(result == expected, "A square is always convertible to a rectangle with the same width and height!
    ");
}

fn area(dimension: (u64, u64)) -> u64 {
    let (x, y) = dimension;
    x * y
}



fn areaRec(rec: Rectangle) -> u64 {
   rec.width * rec.height
}
