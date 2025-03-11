

fn main()  {
    println!("Hello, world");

    let x = 5;
    println!("The value of x is {}", x);
    //can reassign x because it is not mutable
    // x = 6;
    // println!("The value of x is {}", x);

    // mutable variables
    //let's make it mutable by adding mut to the front of the declared value

    let mut q = 5;
    println!("The value of q is {}", q);

    q = 6;

    println!("The value of q is {}", q);

    // shadowing

    let c = 5;
    let c = c + 1;
    {
        let c = c * 2;
        println!("The value of c in the inner scope is {}", c);
    }

    // converting variables 
    let r: u64 = 10;
    println!("this is variable r: {}", r);
    // converts x to a felt, type annotation is required.
    let r: felt252 = r.into(); 
    println!("this is variable r: {}", r); 

    let _w: felt252 = 3;
    //converting to u32
    let _y: u32 = x.try_into().unwrap();

    // Cairo has three data types which are felt252m integers and boolean

    //In Cairo, if you don't specify the type of a variable or argument, its type defaults to a field element, represented by the keyword felt252

    // arthmetic operations 
    let sum = 5_u128 + 10_128;
    println!("sum = {}", sum);

    let difference = 95_u128 - 4_u128;
    println!("difference = {}", difference);

    //multiplication
    let product = 4_u128 * 30_u128;
    println!("product = {}", product);

    //division
    let quotient = 56_u128 / 32_u128;  
    println!("quotient = {}", quotient);

    let remainder = 43_u128 / 5_u128; 
    println!("remainder = {}", remainder);

    //bool
    let is_true: bool = true;
    println!("_is_true = {}", is_true);

    // to handle string in cairo 
    // you either use short string simple quotes 
    //or bytesArray using dounle quotes
    //Cairo uses the felt252 for short strings
// this is limited to 31 characters
    let mychar = 'a';
    println!("mychar = {} is a short string", mychar);

    let long_string: ByteArray = "this is a string which has more than 31 characters";

    println!("long_string = {} is a long string", long_string);


    ///////////////
    /// Compound Types////
    /// ///////////////
    /// tuple it allows you group together variety of types into one compound type
    /// tuple has a fix length
    /// //once they are declare they can grow or shrink in size
    let tup: (i32, u64, u8) = (500, 64, 1);
    println!("tup = {:?}", tup);
    //it can also be destruct using a pattern matching 
    let (z, x, y) = tup;
    if  z == 500 {
        println!("z is 500");
    }
    println!("z = {}, x = {}, y = {}", z, x, y);

    //We can also declare the tuple with value and types, 
    //and destructure it at the same time.
    let (mn, cv): (felt252, felt252) = (2, 3);
    println!("x = {}, y = {}", mn, cv);


    /////////////
    /// Array///
    /// ///////
    // array are used to store value of the same type
    // they are fixed in length define using square brackets 
    //witht type of each elements

    let arr1: [u64; 5] = [1, 2, 3, 4, 5];
    println!("arr1: {:?}", arr1);

    // we can specify same value in array elemenets 
    let _a = [3; 5]; // 3 in 5 places
    println!("a: {:?}", _a);

    // accesing array is in two ways 
    // through desconstruct and using span which is free and doesnt incur any runtime cost

    let my_arr = [1,2,3,4,5];
    let [av, bs, cb, _, _] = my_arr;
    println!("av {}", av);

    // using span 
    let my_span = my_arr.span();
    println!("the third 4 == {}", my_span[3]);

    //we can convert variables with try_into and into
    // It can be used for type conversion when success is guaranteed, 
    // such as when the sourcetype is smaller than the destination type.
    let my_u8: u8 = 10;
    let _my_u16: u16 = my_u8.into();
    let _my_u32: u32 = my_u8.into();

    let my_felt252 = 10;
    // As a felt252 is smaller than a u256, we can use the into() method
    let _my_u256: u256 = my_felt252.into();
    let _my_other_felt252: felt252 = my_u8.into();

    // try_into is use when the value is cant fit into the value we want to convert into
    //such as u256 cant fit in felt252 
    let my_u256: u256 = 10;
    // conversion
    let _my_felt252: felt252 = my_u256.try_into().unwrap();
    let my_u128: u128 = _my_felt252.try_into().unwrap();
    let my_u64: u64 = my_u128.try_into().unwrap();
    let my_u32: u64 = my_u64.try_into().unwrap();
    let my_u16: u16 = my_u32.try_into().unwrap();
    let _my_u8: u8 = my_u16.try_into().unwrap();




    // Constant variables are immutable and can't use mut for the variable
    // they are declared with const not let
    // they must be declared with a type value, it can contain struct, fixed array, and enums

    // struct AnyStruct {
    //     a: u256,
    //     b: u32,
    // }

    // enum AnyEnum {
    //     A: felt252,
    //     B: (usize, u256),
    // }

    // const ONE_HOUR_IN_SECONDS: u32 = 3600;
    // const STRUCT_INSTANCE: AnyStruct = AnyStruct {a: 0, b: 1};
    // const ENUM_INSTANCE: AnyEnum = AnyEnum::A('any enum');
    // // this is a fixed size array of 2 boolean values
    // const BOOL_FIXED_SIZE_ARRAY: [bool; 2] = [true, false]; 

    // we can use consteval_int! to calculate and get computational result
    //const ONE_HOUR_INSTANCE: u32 = consteval_int!(60 * 60);



}



// #[cfg(test)]
// mod tests {
//     use super::fib;

//     #[test]
//     fn it_works() {
//         assert(fib(16) == 987, 'it works!');
//     }
// }
