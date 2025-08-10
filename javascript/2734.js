var smallestString = function(s) {
    let state = 0
    let head_idx = -1
    let first_idx = -1, second_idx = -1
    for (let i = 0; i < s.length; i++) {
        const c = s[i]
        // state 0: no a encountered, 
        //       1: in first a-streak
        //       2: after first a-streak
        //       3: in second a-streak
        if (state === 0) {
            if (c === 'a') {
                state = 1
                first_idx = i
            }
            else {
                head_idx = i
            }
        } else if (state === 1) {
            if (c === 'a') {
                first_idx = i
            } else {
                state = 2
            }
        } else if (state === 2) {
            if (c === 'a') {
                second_idx = i
                state = 3
            }
        } else if (state === 3) {
            break
        }
    }
    if (first_idx === -1) {
        return String.fromCharCode(...s.split('').map(x => x.charCodeAt()-1))
    } else if (head_idx !== -1) {
        return String.fromCharCode(...(s.substring(0, head_idx+1).split('').map(x=>x.charCodeAt()-1)))+s.substring(head_idx+1)
    } else if (first_idx === s.length-1) {
        return s.substring(0, s.length-1) + 'z'
    }
     else if (second_idx === -1) {
        return s.substring(0, first_idx+1) 
               + String.fromCharCode(...s.substring(first_idx+1).split('').map(x => x.charCodeAt()-1))
    } else {
        return s.substring(0, first_idx+1)  
               + String.fromCharCode(...s.substring(first_idx+1, second_idx).split('').map(x => x.charCodeAt()-1))
               + s.substring(second_idx) 
    }
};