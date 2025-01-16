var expect = function(val) {
    return {
        toBe: function(v2) {
            if (v2 === val) return true
            else throw "Not Equal"
        },
        notToBe: function(v2) {
            if (v2 !== val) return true
            else throw "Equal"
        }
    }
};

console.log(expect(5).toBe(5)); // true
console.log(expect(5).notToBe(5)); // throws "Equal"
