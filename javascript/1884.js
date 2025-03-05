var twoEggDrop = function(k) {
   let a = [...Array(k+1).keys()]
   let b = [0, 1]
   for (let i = 2; i <= k; i++) {
       let mn = a[i]
       for (let j = 1; j <= i; j++) {
           let x = a[j-1] + 1
           let y = b[i-j] + 1
           let z = Math.max(x, y)
           if (mn > z) mn = z
       }
       b[i] = mn
   }
   return b[k]
};