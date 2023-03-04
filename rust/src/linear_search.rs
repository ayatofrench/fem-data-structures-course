fn linear_search(haystack: &[i32], needle: i32) -> bool {
    for value in haystack.iter() {
        if value.eq(&needle) {
            return true;
        }
    }

    return false;
}

#[test]
fn linear_search_test() {
    let foo: [i32; 11] = [1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420];

    assert_eq!(linear_search(&foo, 69), true);
    assert_eq!(linear_search(&foo, 1336), false);
    assert_eq!(linear_search(&foo, 69420), true);
    assert_eq!(linear_search(&foo, 69421), false);
    assert_eq!(linear_search(&foo, 1), true);
    assert_eq!(linear_search(&foo, 0), false);
}
