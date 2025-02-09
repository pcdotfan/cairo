trait Copy<T>;
trait Drop<T>;

impl SnapshotCopy<T> of Copy<@T>;
impl SnapshotDrop<T> of Drop<@T>;

// TODO(spapini): When associated types are supported, support the general trait Add<X, Y>.
trait Add<T> {
    fn add(lhs: T, rhs: T) -> T;
}
trait AddEq<T> {
    fn add_eq(ref self: T, other: T);
}

// TODO(spapini): When associated types are supported, support the general trait Sub<X, Y>.
trait Sub<T> {
    fn sub(lhs: T, rhs: T) -> T;
}
trait SubEq<T> {
    fn sub_eq(ref self: T, other: T);
}

// TODO(spapini): When associated types are supported, support the general trait Mul<X, Y>.
trait Mul<T> {
    fn mul(lhs: T, rhs: T) -> T;
}
trait MulEq<T> {
    fn mul_eq(ref self: T, other: T);
}

// TODO(spapini): When associated types are supported, support the general trait Div<X, Y>.
trait Div<T> {
    fn div(lhs: T, rhs: T) -> T;
}
trait DivEq<T> {
    fn div_eq(ref self: T, other: T);
}

// TODO(spapini): When associated types are supported, support the general trait Rem<X, Y>.
trait Rem<T> {
    fn rem(lhs: T, rhs: T) -> T;
}
trait RemEq<T> {
    fn rem_eq(ref self: T, other: T);
}

trait PartialEq<T> {
    fn eq(lhs: T, rhs: T) -> bool;
    fn ne(lhs: T, rhs: T) -> bool;
}

// TODO(spapini): When associated types are supported, support the general trait BitAnd<X, Y>.
trait BitAnd<T> {
    fn bitand(lhs: T, rhs: T) -> T;
}

// TODO(spapini): When associated types are supported, support the general trait BitOr<X, Y>.
trait BitOr<T> {
    fn bitor(lhs: T, rhs: T) -> T;
}

// TODO(spapini): When associated types are supported, support the general trait BitXor<X, Y>.
trait BitXor<T> {
    fn bitxor(lhs: T, rhs: T) -> T;
}

trait PartialOrd<T> {
    fn le(lhs: T, rhs: T) -> bool;
    fn ge(lhs: T, rhs: T) -> bool;
    fn lt(lhs: T, rhs: T) -> bool;
    fn gt(lhs: T, rhs: T) -> bool;
}

/// Trait for conversion between types.
trait Into<T, S> {
    fn into(self: T) -> S;
}

/// Trait for fallible conversion between types.
trait TryInto<T, S> {
    fn try_into(self: T) -> Option<S>;
}

trait Neg<T> {
    fn neg(a: T) -> T;
}

trait Not<T> {
    fn not(a: T) -> T;
}

/// The following two traits are for implementing the [] operator. Only one should be implemented
/// for each type. Both are not consuming of self, the first gets a snapshot of the object and 
/// the second gets ref.
trait IndexView<C, I, V> {
    fn index(self: @C, index: I) -> V;
}

trait Index<C, I, V> {
    fn index(ref self: C, index: I) -> V;
}

trait Destruct<T> {
    fn destruct(self: T) nopanic;
}

// TODO(spapini): Remove this, it can lead to multiple impls and unwanted Destruct implementation.
impl DestructFromDrop<T, impl TDrop: Drop<T>> of Destruct<T> {
    #[inline(always)]
    fn destruct(self: T) nopanic {}
}

trait Default<T> {
    fn default() -> T;
}

/// Trait for default values of value in a dict. Should be logically equivalent to 0.
trait Felt252DictValue<T> {
    fn zero_default() -> T nopanic;
}
