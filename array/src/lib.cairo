// fn main() -> u128 {
//     // working wtith array elements 
//     // we can use ArrayTrait to create a new array
//     // can be modified and once we write to a slot we can modify the or overrite the slot
// // you can onl;y add elements to the array from the back and remove from the front of array 

//     let mut a = ArrayTrait::new();
//     // adding array elements
//     a.append(1);
//     a.append(2);

//     println!("array elements {:?}", a);

//     // we can pass they expected types in the array 
//     let mut arr = ArrayTrait::<u128>::new();
//     // or
//     let mut arrr:Array<u128> = ArrayTrait::new();

//     // removing elemenets in array
//     // to remove element from the first element we using pop_front()
//     // it take the Option which check in case the array is emty
//     let rem_value = a.pop_front().unwrap();

//     println!("array elements {}", rem_value);

//     // to get value from array we use the get() and at() methods
//     // get is safe to use returns the Option<Box<@T>> when return none if the array is empty 
//     // a.append(8);

//     let mut newArr = ArrayTrait::<u128>::new();
//     newArr.append(100);
//     let index_to_access = 1;

//     // remember to return -> a u128 in the function
//     match newArr.get(index_to_access) {
//         Option::Some(x) => {
//             *x
//             .unbox()
//         },
//         Option::None => {
//             panic!("index out of range")
//         },
//     }

// }

// using at()

#[derive(Copy, Drop)]
    enum Data {
        Interger: u128,
        Felt: felt252,
        Tuple: (u32, u32),
    }

fn main () {
    let mut a = ArrayTrait::new();
        // adding array elements
        a.append(1);
        a.append(2);
        // using the unbox operator
        // if failed it will cause panic error 
    let first = *a.at(0);
    assert!(first == 1);

    // create a value size usring array! macro which we already know at a compile time 
    let mut arr = array![1, 2, 3, 4, 5];
    println!("arr: {:?}", arr);

    // we can store multiple value useing enum in arrays 
    // define enum which have access to copy and Drop
    let mut messssge: Array<Data> = array![];
    messssge.append(Data::Interger(10));
    messssge.append(Data::Felt('happy Sunday'));
    messssge.append(Data::Tuple((10, 20)));

    // println!("messsage: {:?}", messssge);
}



