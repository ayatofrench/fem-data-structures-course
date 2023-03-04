fn binary_search(haystack: &[i32], needle: i32) -> bool {
    let mut lo = 0;
    let mut hi = haystack.len();

    while lo < hi {
        let mid = lo + (hi - lo) / 2;
        let target = haystack[mid];

        if target == needle {
            return true;
        } else if target > needle {
            hi = mid;
        } else {
            lo = mid + 1;
        }
    }

    return false;
}

#[test]
fn binary_search_test() {
    let foo: [i32; 11] = [1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420];

    assert_eq!(binary_search(&foo, 69), true);
    assert_eq!(binary_search(&foo, 1336), false);
    assert_eq!(binary_search(&foo, 69420), true);
    assert_eq!(binary_search(&foo, 69421), false);
    assert_eq!(binary_search(&foo, 1), true);
    assert_eq!(binary_search(&foo, 0), false);
}
