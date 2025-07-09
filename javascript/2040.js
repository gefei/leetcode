var maxFreeTime = function(eventTime, k, startTime, endTime) {
  let len = startTime.length
  let empty = []
  if (startTime[0] > 0) {
    empty = [startTime[0]]
  }
  let b = endTime[0], i = 1
  while (i <= len-1) {
    empty.push(startTime[i]-b)
    b = endTime[i]
    i++
  }
  if (b < eventTime) {
    empty.push(eventTime - b)
  }

  len = empty.length
  if (len === 0) return 0
  k = k + 1
  if (k > len) k = len
  let s = 0
  for (let i = 0; i < k; i++) {
    s = s + empty[i]
  }
  let mx = s
  for (let i = k; i < len; i++) {
    s = s + empty[i] - empty[i-k]
    if (mx < s) mx = s
  }
  return mx
};