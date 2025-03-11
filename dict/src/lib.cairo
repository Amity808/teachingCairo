//import Felt252Dict to use dict 
use core::dict::Felt252Dict;
use core::nullable::{NullableTrait, match_nullable, FromNullableResult};

fn main() {
    //creating a Dic instance using the Felt252Dict with defualt and type u64
    let mut balances: Felt252Dict<u64> = Default::default();
// inserting values to dictionary 
    balances.insert('Bola', 100);
    balances.insert('Ayo', 100);

    // getting the value with the key using get

    let bola_balance = balances.get('Bola');
    assert!(bola_balance == 100, "Balance is not 100");

    let ayo_balance = balances.get('Ayo');
    assert!(ayo_balance == 100, "Balance is not 100");
    // you tried to get the balance of an inexistent user 
    // you will get 0 instead of an error or undefined value

    // Felt252DictValue<T> This trait defines the zero_default 
    // method which is the one that gets called when a value does not exist in the dictionary. 

    //Dictionaries of Types not Supported Natively
    // import
    // use core::nullable::{NullableTrait, match_nullable, FromNullableResult};
    // use core::dict::Felt252Dict;
    let mut d: Felt252Dict<Nullable<Span<felt252>>> = Default::default();

    // create the dictionary
    let a = array![8, 9, 10];

    // insert it as a Span
    d.insert(0, NullableTrait::new(a.span()));
    let val = d.get(0);

    // Search the value and assert it is not null
    let span = match match_nullable(val) {
        FromNullableResult::Null => panic!("No value found"),
        FromNullableResult::NotNull(val) => val.unbox(),
    };

    // Verify we are having the right values
    assert!(*span.at(0) == 8, "Expecting 8");
    assert!(*span.at(1) == 9, "Expecting 9");
    assert!(*span.at(2) == 10, "Expecting 10");

    // using array inside diction
    let newArr = array![20, 40, 50];

    let mut dict: Felt252Dict<Nullable<Array<u8>>> = Default::default();

    dict.insert(0, NullableTrait::new(newArr));
    // let val = dict.get(0);
    // println!("val: ", val);
    println!("Before insertion: {:?}", get_array_entry(ref dict, 0));
    append_value(ref dict, 0, 100);
    println!("After insertion: {:?}", get_array_entry(ref dict, 0));


}

// fn get_array_entry(ref dict: Felt252Dict<Nullable<Array<u8>>>, index: felt252) -> Span<u8> {
//     let val = dict.get(0); // This will cause a compiler error
//     let arr = match match_nullable(val) {
//         FromNullableResult::Null => panic!("No value!"),
//         FromNullableResult::NotNull(val) => val.unbox(),
//     };
//     arr.span()
// }

fn get_array_entry(ref dict: Felt252Dict<Array<u8>>, index: felt252) -> Span<u8> {
    // let val = dict.get(index); this will cause a panic error
    let (entry, _arr) = dict.entry(index);
    let mut arr = _arr.deref_or(array![]);
    let span = arr.span();
    dict = entry.finalize(NullableTrait::new(arr));
    span
}

fn append_value(ref dict: Felt252Dict<Nullable<Array<u8>>>, index: felt252, value: u8) {
    let (entry, arr) = dict.entry(index);
    let mut unboxed_val = arr.deref_or(array![]);
    unboxed_val.append(value);
    dict = entry.finalize(NullableTrait::new(unboxed_val));
}

// fn fib(mut n: u32) -> u32 {
//     let mut a: u32 = 0;
//     let mut b: u32 = 1;
//     while n != 0 {
//         n = n - 1;
//         let temp = b;
//         b = a + b;
//         a = temp;
//     };
//     a
// }

// #[cfg(test)]
// mod tests {
//     use super::fib;

//     #[test]
//     fn it_works() {
//         assert(fib(16) == 987, 'it works!');
//     }
// }
