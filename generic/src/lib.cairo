

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

// The PartialOrd trait implements comparison operations for T
// using the PartialOrd trait to compare 
fn smallest_number<T, impl TPartialOrd: PartialOrd<T>, impl TCopy: Copy<T>, impl TDrop: Drop<T>>(list: @Array<T>) -> T {
    // Notice that we use the desnap (*) operator
    let mut smallest = *list[0];

    // the index we will use to loop through the list 
    // it should be immutable 
    let mut index = 1;
    //

    // Iterating through the whole list storing the smallest element
    while index < list.len() {
        if *list[index] < smallest {
            smallest = *list[index];
        }
        index = index + 1;
    };

    smallest

}

// we can alseo use generic type for struct as well
#[derive(Copy, Drop)]
struct Wallet<T> {
    balance: T,
}

// we can have a different field with different genric type value
#[derive(Drop)]
struct Wallet1<T, U> {
    balance: T,
    address: U
}

// the above is equivalent to this 
//just that it automaticaly generates generic type
// impl WalletDrop<T, +Drop<T>> of Drop<Wallet<T>>;

// it can be used on traits as well 
trait WalletTrait<T> {
    fn balance(self: @Wallet<T>) -> T;
}

// implementation 
impl WalletImpl<T, +Copy<T>> of WalletTrait<T> {
    fn balance(self: @Wallet<T>) -> T {
        return *self.balance;
    }
}
// for known types
/// Trait for wallets of type u128
trait WalletReceiveTrait {
    fn receive(ref self: Wallet<u128>, value: u128);
}

impl WalletReceiveImpl of WalletReceiveTrait {
    fn receive(ref self: Wallet<u128>, value: u128) {
        self.balance += value;
    }
}

// generic with mixture 
// remember traits are like interface in some programming language
// it can be declare as a public 
trait WalletMixTrait<T1, U1> {
    fn mixup<T2, +Drop<T2>, U2, +Drop<U2>>(
        self: Wallet1<T1, U1>, other: Wallet1<T2, U2>,
    ) -> Wallet1<T1, U2>;
}

impl WalletMixImpl<T1, +Drop<T1>, U1, +Drop<U1>> of WalletMixTrait<T1, U1> {
    fn mixup<T2, +Drop<T2>, U2, +Drop<U2>>(
        self: Wallet1<T1, U1>, other: Wallet1<T2, U2>,
    ) -> Wallet1<T1, U2> {
        Wallet1 { balance: self.balance, address: other.address }
    }
}


fn main() {
    let mut l1 = array![1, 2];
    let mut l2 = array![1,2,4];

    let l3 = largest_list(l1, l2);
    let w = Wallet { balance: 4};
    assert!(w.balance() == 4);
    let w1 = Wallet1 { balance: 3, address: 14 };

}