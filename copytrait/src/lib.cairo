//to be a able to reuse some component we must use Copy and Drop Trait

// for instance 
use core::dict::Felt252Dict;


#[derive(Copy, Drop)]
struct Point {
    x: u128,
    y: u128,
}

#[derive(Destruct)]
struct A {
    dict: Felt252Dict<u128>,
}

#[derive(Copy, Drop)]
struct Rectangle {
    height: u64,
    width: u64,
}

#[derive(Copy)]
struct Rectangle2 {
    height: u64,
    width: u64,
}

fn main() {
    let p1 = Point { x: 10, y: 20 };
    foo(p1);
    foo(p1);

    

    A { dict: Default::default() }; // No error here



    // you can clone an array 
    // in cairo snapshot is an immutable view
    let mut arr3: Array<u128> = array![];
    // let arr4 = arr3.clone();
    let arr5 = @arr3;
    arr3.append(5);
    let first_len = calculate(arr5);
    let second_len = calculate(@arr3);
    println!("The length of the array when the snapshot was taken is {}", first_len);
    println!("The current length of the array is {}", second_len);

    // To convert a snapshot back into a regular variable, 
    // you can use the desnap operator *, which serves as the opposite of the @ operator.

    // using desnap 
    let rec = Rectangle { height: 3, width: 5 };
    let area = calculate_areaOfRec(@rec);
    println!("The area of the rectangle {}", area);
    
    // working with ref to modify
    // In Cairo, a parameter can only be passed as mutable reference 
    //using the ref modifier if the variable is declared as mutable with mut.
    let mut rec1 = Rectangle { height: 3, width: 5 };
    flip(ref rec1);
    println!("The height {} and  width {}", rec.height, rec.width);
    // we change rec to be mut. Then we pass a mutable reference 
    //of rec into flip with ref rec, and update the function signature 
    //to accept a mutable reference with ref rec: Rectangle. 
    // This makes it very clear that the flip function will mutate 
    //the value of the Rectangle instance passed as parameter.



}
// fn calculateDestructing(arr: @Array<u128>) -> (Array<u128>, usize) {
//     let length = arr.len();
//     (arr, length)
// }

fn calculate(arr: @Array<u128>) ->  usize {
    arr.len()
}

//working with desnap operator *, which serves as the opposite of the @ operator
fn calculate_areaOfRec(rec: @Rectangle) -> u64 {
    // As rec is a snapshot to a Rectangle, its fields are also snapshots of the fields types.
    // We need to transform the snapshots back into values using the desnap operator `*`.
    // This is only possible if the type is copyable, which is the case for u64.
    // Here, `*` is used for both multiplying the height and width and for desnapping the snapshots.
    *rec.height * *rec.width

}

//using ref 
fn flip(ref rec: Rectangle) {
    let temp = rec.height;
    rec.height = rec.width;
    rec.width = temp;
}

fn foo(p: Point) {

}

