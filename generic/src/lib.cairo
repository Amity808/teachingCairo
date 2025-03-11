

// using type t betwen angular 
// this wont compile 
// fn larget_list<T>(l1: Array<T>, l2: Array<T>) -> Array<T> {
//     if l1.len() > l2.len() {
//         l1
//     } else {
//         l2
//     }
// }
// The largest_list function compares two lists of the same 
// type and returns the one with more elements and drops the other. 
//If you compile the previous code, you will notice that
// it will fail with an error saying that there are no traits 
//defined for dropping an array of a generic type. 
//This happens because the compiler has no way to guarantee that an Array<T> is droppable 
//when executing the main function. In order to drop an array of T, 
//the compiler must first know how to drop T. 
//This can be fixed by specifying in the function signature of largest_list 
//that T must implement the Drop 
// trait. The correct function definition of largest_list is as follows:
// so do that let implement Drop trait to drop one array 
fn largest_list<T, impl TDrop: Drop<T>>(l1: Array<T>, l2: Array<T>) -> Array<T> {
    if l1.len() > l2.len() {
        l1
    } else {
        l2
    }
}

fn main() {
    let mut l1 = array![1, 2];
    let mut l2 = array![1,2,4];

    let l3 = largest_list(l1, l2);
}