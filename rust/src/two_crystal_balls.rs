use rand::prelude::*;

fn two_crystal_balls(breaks: &[bool; 10_000]) -> isize {
    let len = breaks.len() as f64;
    let idx: usize = len.sqrt().floor() as usize;
    let mut i = idx;

    while i < breaks.len() {
        if breaks[i] {
            break;
        }

        i += 1;
    }

    i -= idx;

    let mut j = 0;

    while j < breaks.len() && i < breaks.len() {
        if breaks[i] {
            return i.try_into().unwrap();
        }

        j += 1;
        i += 1;
    }

    return -1;
}

#[test]
fn two_crystal_balls_test() {
    let mut rng = rand::thread_rng();
    let rand_val: f64 = rng.gen::<f64>() * 10_000.0;
    let idx = rand_val.floor() as usize;
    let mut data: [bool; 10_000] = [false; 10_000];

    let mut i = idx;

    while i < 10000 {
        data[i] = true;

        i += 1;
    }

    assert_eq!(two_crystal_balls(&data), isize::try_from(idx).unwrap());
    assert_eq!(two_crystal_balls(&[false; 10000]), -1);
}
